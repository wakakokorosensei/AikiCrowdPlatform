class Page
  include Mongoid::Document
  include Mongoid::Timestamps

  field :pagetype, type: String
  field :content, type: String

  embedded_in :project, inverse_of: :project
  belongs_to :user


  scope :homepage, ->{ where(pagetype: 'home') }
  scope :updatepage,  ->{ where(pagetype: 'update') }

end
