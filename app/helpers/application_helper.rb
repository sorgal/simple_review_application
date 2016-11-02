module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(:button, 'x'.html_safe, class: "close", data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  def average_rating_for(object)
    if object.rating_value > 0 && object.rating_count > 0
      return (object.rating_value.to_f / object.rating_count).round(2)
    end
    0
  end

  def rating_object_type(object)
    object.class.to_s.underscore
  end

end
