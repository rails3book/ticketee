module ApplicationHelper
  def title(*parts)
    @title = (parts << "Ticketee").join(" - ") unless parts.empty?
    @title || "Ticketee"
  end
  
  def admins_only(&block)
    block.call if current_user.try(:admin?)
    nil
  end
  
  def authorized?(permission, thing, &block)
    block.call if can?(permission.to_sym, thing) ||
             current_user.try(:admin?)
    nil
  end
end