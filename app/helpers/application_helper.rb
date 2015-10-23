module ApplicationHelper
  def navbar_links
    [
      { text: "Our Vision", path: vision_path },
      { text: "Doctors",    path: doctors_path },
      { text: "Services",   path: services_path },
      { text: "Your Visit", path: visit_path },
      { text: "FAQ",        path: faq_path }
    ]
  end

  def procedures
    [
      {
        classes: "hernia", kind: "Hernia", physician: "Dr. Prats",
        physician_link: vision_path, procedure_link: home_path
      },
      {
        classes: "kidney", kind: "Kidney", physician: "Dr. Nicholson",
        physician_link: vision_path, procedure_link: home_path
      },
      {
        classes: "breast", kind: "Breast", physician: "Dr. Mudge",
        physician_link: vision_path, procedure_link: home_path
      },
    ]
  end
end
