class ProjectType
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :percent, type: Integer

  has_many :projects

end
