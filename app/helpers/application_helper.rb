module ApplicationHelper
  def toast_klass(flash_message_klass)
    case flash_message_klass.to_sym
    when :alert, :error
      "toast align-items-center bg-danger border-0 mb-2"
    else
      "toast align-items-center bg-primary border-0 mb-2"
    end
  end
end
