class Address
  include Mongoid::Document
  include Mongoid::Timestamps

  field :street,               type: String, default: ''
  field :phone_number,         type: String, default: ''
  field :zip_code,             type: String, default: ''
  field :city,                 type: String, default: ''
  field :state,                type: String, default: ''
  field :country,              type: String, default: ''
  field :address_type,         type: String, default: ''

  # field :billing_street,               type: String, default: ''
  # field :billing_phone_number,         type: String, default: ''
  # field :billing_zip_code,             type: String, default: ''
  # field :billing_city,                 type: String, default: ''
  # field :billing_state,                type: String, default: ''
  # field :billing_country,              type: String, default: ''
  # field :billing_address_type,         type: String, default: ''
  # field :same_as_shipping_address,      type: Boolean, default: false

  belongs_to :user
  has_many :contributions

end
