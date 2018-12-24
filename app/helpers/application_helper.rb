module ApplicationHelper
  def notification_type(flash_key)
    case flash_key
    when 'notice'
      'primary'
    when 'alert'
      'danger'
    else
      'link'
    end
  end
end
