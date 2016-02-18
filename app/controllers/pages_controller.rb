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
end
