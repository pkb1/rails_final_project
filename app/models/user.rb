class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :timeoutable,
         :omniauthable,
         :omniauth_providers => [:twitter, :facebook, :linkedin, :github, *(:developer if Rails.env.development?)]

  def self.from_omniauth(auth)
    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #   user.email = auth.info.email
    #   user.password = SecureRandom.base64(15)
    # end
    user = find_or_create_by(uid: auth.id, provider: auth.provider)
    user.email = auth.info.email
    user.password = SecureRandom.base64(15)
    user.confirmed_at = Time.now
    user.save(validate: false)
    user
  end
 
end