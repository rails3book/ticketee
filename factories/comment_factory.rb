Factory.define :comment do |comment|
  comment.text "A plain old boring comment."
  comment.ticket { |t| t.association(:ticket) }
  comment.user { |u| u.association(:user) }
end