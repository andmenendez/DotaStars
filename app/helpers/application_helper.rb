module ApplicationHelper
  def flash_class(level)
    case level
      when :success then "flash-success"
      when :alert then "flash-danger"
    end
  end
end
