class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :short_image, type: String
  field :goal, type: BigDecimal
  field :start_at, type: Date
  field :expires_at, type: Date
  field :image_url, type: String
  field :video_url, type: String
  field :type_of_project, type: String
  field :finished, type: Boolean, default: false
  field :granted, type: Boolean, default: false
  field :rejected, type: Boolean, default: false
  field :recommended, type: Boolean, default: false
  field :successful, type: Boolean, default: false
  field :reached, type: BigDecimal, default: 0


  validates :short_image, allow_blank: true, format: {with:%r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.'}
  validates :image_url, allow_blank: true, format: {with:%r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.'}


  #embeds_many :rewards, cascade_callbacks: true
  embeds_many :pages, cascade_callbacks: true
  has_many :rewards
  has_many :comments
  belongs_to :user
  belongs_to :category
  belongs_to :project_type
  accepts_nested_attributes_for :category, :rewards, :project_type, :pages


end

