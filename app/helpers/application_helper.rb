module ApplicationHelper
  def link_to_homepage
    link_to 'Return to Homepage', root_path
  end

  def link_to_dashboard
    link_to 'Return to Dashboard', admin_dashboard_path
  end
end
