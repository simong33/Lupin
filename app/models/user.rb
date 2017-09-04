class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  devise :omniauthable, omniauth_providers: [:twitter]

  has_many :competitors
  has_many :targets, through: :competitors

  def self.from_omniauth(auth)
       where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
         user.provider = auth.provider
         user.uid = auth.uid
         user.email = auth.info.email
         user.password = Devise.friendly_token[0,20]
         user.nickname = auth.info.nickname
         user.name = auth.info.name
         user.location = auth.info.location
         user.image = auth.info.image
         user.description = auth.info.description
         user.token = auth.credentials.token
         user.secret = auth.credentials.secret
       end
   end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def credentials
    {
      consumer_key: ENV['TWITTER_KEY'],
      consumer_secret: ENV['TWITTER_SECRET'],
      access_token: self.token,
      access_token_secret: self.secret
    }
  end

  def client
    credentials = self.credentials
    Twitter::REST::Client.new(credentials)
  end
end
