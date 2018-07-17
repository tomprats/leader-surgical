class PainController < ApplicationController
  def show
    return pdf if params[:pdf]
  end

  private
  def pdf
    # TODO: Analytics

    name = []
    options = {}
    [:ac, :ic, :lbmi, :or].each do |option|
      options[option] = boolean(params[option])
      name.push option if options[option]
    end

    send_data(
      PainPDF.new(options).render,
      filename: "pain-#{name.join("-")}.pdf",
      type: "application/pdf",
      disposition: "inline"
    )
  end

  def boolean(value)
    return true if value.to_s == "true"
    return false if value.to_s == "false"
    raise "Invalid Boolean"
  end
end
