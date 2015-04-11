class Contribution
  include Mongoid::Document
  include Mongoid::Timestamps


  field :data, type: Hash #[person, shipping_address, billing_address, payment]

  belongs_to :reward
  belongs_to :user
  belongs_to :address
end
