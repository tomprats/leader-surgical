class PagesController < ApplicationController
  def doctors
    @doctors = Doctor.active
  end

  def services
    @services = Specialty.active.top_level
    @doctors = Doctor.active
  end

  def visit
    @visits = Visit.active.root
  end

  def faq
    @faqs = FAQ.active
  end
end
