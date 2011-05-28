class Notifier < ActionMailer::Base
  default from: "ticketee@gmail.com"
  
  def comment_updated(comment, user)
    @comment = comment
    @user = user
    mail(:to => user.email,
         :from => "Ticketee <ticketee+#{comment.project.id}+#{comment.ticket_id}@gmail.com>",
         :subject => "[ticketee] #{comment.ticket.project.name} - #{comment.ticket.title}")
  end
end
