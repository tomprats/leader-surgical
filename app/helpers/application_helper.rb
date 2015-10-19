module ApplicationHelper
  def navbar_links
    [
      { text: "Our Vision", path: vision_path },
      { text: "Services",   path: services_path },
      { text: "Your Visit", path: visit_path },
      { text: "FAQ",        path: faq_path },
      { text: "Feedback",   path: feedback_path }
    ]
  end
end
