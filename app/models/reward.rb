class Reward
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :amount, type: Numeric, default: 0
  field :description, type: String
  field :maximum_backers, type: Integer
  field :taken, type: Integer, default: 0
  field :remain, type: Integer, default: 0
  field :sold_out, type: Boolean, default: false
  field :expires_at, type: Date
  field :estimated_delivery_at, type: Date
  field :no_shipping_involved, type: Boolean, default: false
  field :ships_anywhere, type: Boolean, default: false
  field :ships_certain, type: Boolean, default: false
  field :contributors, type: Hash
  field :bonus, type: Integer, default: 0
  field :has_bonus, type: Boolean, default: false
  field :bonus_quantity, type: Integer, default: 0
  #field :lock, type: Lockable


  belongs_to :project
  has_many :contributions

end

