class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment_message, :user_id, :post_id
end
