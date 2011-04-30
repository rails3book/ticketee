module ApplicationHelper
  def title(*parts)
    @title = (parts << "Ticketee").join(" - ") unless parts.empty?
    @title || "Ticketee"
  end
end