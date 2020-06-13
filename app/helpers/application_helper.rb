module ApplicationHelper
  def navbar_links
    [
      { text: "Our Vision", path: vision_path },
      { text: "Doctors",    path: doctors_path },
      { text: "Services",   path: services_path },
      { text: "FAQ",        path: faq_path }
    ]
  end
end
