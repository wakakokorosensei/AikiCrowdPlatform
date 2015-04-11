class Reward
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :price, type: BigDecimal
  field :maximum_backers, type: Integer
  field :description, type: String
  field :sold_out, type: Boolean, default: false
  field :expires_at, type: Date
  field :bonus, type: BigDecimal
  field :has_bonus, type: Boolean, default: false
  field :estimated_delivery, type: Time
  field :backers, type: Hash


  belongs_to :project
  has_many :contributions

end

