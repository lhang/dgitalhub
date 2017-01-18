class Comment < ActiveRecord::Base
  has_many :child_comments, class_name: "Comment",
                           foreign_key: "parent_comment_id"
  belongs_to :parent_comment, class_name: "Comment"
  belongs_to :dgital
  belongs_to :user
end
