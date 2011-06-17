class CommentNotifierJob < Struct.new(:comment_id)
  def perform
    comment = Comment.find(comment_id)
    watchers = comment.ticket.watchers - [comment.user]
    watchers.each do |user|
      Notifier.comment_updated(comment, user).deliver
    end
  end
end