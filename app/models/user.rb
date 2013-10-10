class User < ActiveRecord::Base
  def self.from_omniauth(params)
    if authorized_users.include? username(params)
      find_user(params) || create_user(params)
    else
      return false
    end
  end

  def self.find_user(params)
    User.find_by(
      provider: params.provider,
      uid:      params.uid
      )
  end

  def self.create_user(params)
    user = User.new

    user.provider    = params.provider
    user.uid         = params.uid
    user.name        = params.info.name
    user.email       = params.info.email
    user.image       = params.info.image
    user.oauth_token = params.credentials.token

    user.save
    user
  end

  def self.authorized_users
    %w[novohispano burtlo kytrinyx jcasimir]
  end

  def self.username(params)
    params.info.nickname
  end
end