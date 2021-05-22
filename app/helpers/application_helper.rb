module ApplicationHelper
  include Pagy::Frontend

  def nav_link_klass(paths)
    if paths.any? { |path| current_page?(path) }
      "nav-link active"
    else
      "nav-link"
    end
  end

  def toast_klass(flash_message_klass)
    case flash_message_klass.to_sym
    when :alert
      "toast align-items-center bg-danger border-0"
    else
      "toast align-items-center bg-primary border-0"
    end
  end
end
