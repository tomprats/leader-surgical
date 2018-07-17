class PainPDF < Prawn::Document
  def initialize(options)
    super

    options.each do |option, value|
      text "#{option} is #{value}"
    end
  end
end
