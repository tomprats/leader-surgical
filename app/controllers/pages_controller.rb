class PagesController < ApplicationController
  def vision
    @visions = Vision.active
  end

  def doctors
    @doctors = Doctor.active
  end

  def services
    @doctors = Doctor.active
    @specialties = Specialty.active.top_level
    @procedures = Procedure.active
    @body_parts = BodyPart.active
  end

  def visit
    @visits = Visit.active.root
  end

  def faq
    @faqs = FAQ.active
  end

  def show
    @page ||= Page.find_by(path: params[:path]) || not_found
    @html = @page.text_to_html
    @specialty = @page.specialty
  end
end
