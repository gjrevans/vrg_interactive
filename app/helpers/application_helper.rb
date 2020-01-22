module ApplicationHelper
  def notify_class_for(flash_type)
    { success: "success", error: "danger", alert: "warning", notice: "info" }[flash_type.to_sym] || flash_type.to_s
  end
  
  def disable_with(text)
    "<i class=\"fas fa-spinner-third fa-spin mr-2\"></i> #{text}".html_safe
  end
end
