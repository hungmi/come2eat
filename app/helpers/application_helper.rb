module ApplicationHelper

  def comment; end

  def notice_message
    alert_types = { notice: :success, alert: :danger }

    close_button_options = { class: "close", "data-dismiss" => "alert", "aria-hidden" => true }
    close_button = content_tag(:button, "×", close_button_options)

    alerts = flash.map do |type, message|
      alert_content = close_button + message

      alert_type = alert_types[type.to_sym] || type
      alert_class = "alert alert-#{alert_type} alert-dismissable"

      content_tag(:div, alert_content, class: alert_class)
    end

    alerts.join("\n").html_safe
  end

  def index_or_login_links(condition, link_text, another_link_text)
    if condition == 'restaurant'
      return content_tag(:p, class:'text-center') do
        if current_restaurant
          raw(link_to link_text, restaurant_foods_path(current_restaurant.id))
        else
          raw(link_to another_link_text, new_restaurant_session_path)
        end
      end
    end
    if condition == 'admin'
      return content_tag(:p, class:'text-center') do
        if current_admin
          raw(link_to link_text, admin_orders_path)
        else
          raw(link_to another_link_text, new_admin_session_path)
        end
      end
    end

  end

  def conditional_links(condition, link, link_text, another_link, another_link_text)
    content_tag(:p, class:'text-center') do
      if condition
        raw(link_to link_text, link)
      else
        raw(link_to another_link_text, another_link)
      end
    end
  end

end