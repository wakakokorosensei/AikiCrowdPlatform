class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable #, :confirmable



  #campo virtual para acceder al email o username
  attr_accessor :signin

  #Controles y validaciones
  validates :username, :uniqueness => {:case_sensitive => false}

  ## Database authenticatable
  field :username,           type: String, default: ''
  field :email,              type: String, default: ''
  field :encrypted_password, type: String, default: ''

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time



  ## User personal Info
  field :first_name,        type: String, default: ''
  field :second_name,       type: String, default: ''
  field :locale,            type: String, default: 'eng'
  field :twitter,           type: String, default: ''
  field :facebook_link,     type: String, default: ''
  field :other_link,        type: String, default: ''
  field :uploaded_image,    type: String, default: ''

  #Backer Info
  field :requested_refund,  type: Boolean, default: false
  field :refunded,          type: Boolean, default: false
  field :credits,           type: Integer, default: 0

  #Contact Info
  field :street,               type: String, default: ''
  field :phone_number,         type: String, default: ''
  field :zip_code,             type: String, default: ''
  field :city,                 type: String, default: ''
  field :state,                type: String, default: ''
  field :country,              type: String, default: ''


  #Relaciones con otros modelos
  has_many :projects
  has_many :comments
  #has_many :contributions
  has_many :addresses


  #Con este override busco el user segun el tipo de login que hace
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:signin).downcase
      where(conditions).where('$or' => [ {:username => /^#{Regexp.escape(login)}$/i}, {:email => /^#{Regexp.escape(login)}$/i} ]).first
    else
      where(conditions).first
    end
  end

end
