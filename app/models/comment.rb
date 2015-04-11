class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, type: String
  field :content, type: String

  belongs_to :project
  belongs_to :user

end