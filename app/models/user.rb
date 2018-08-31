class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :vkontakte]

  has_many :readings, dependent: :destroy
  has_many :words

  def self.create_from_omniauth(params)
    user = find_or_create_by(email: params.info.email, uid: params.uid)
    user.update({
      token: params.credentials.token,
      name: params.info.name,
      image: params.info.image,
      password: Devise.friendly_token[0,20]
    })
    user
  end
end
