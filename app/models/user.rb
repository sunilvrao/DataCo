class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :twitter_id
  # attr_accessible :title, :body

  def self.find_for_facebook_oauth(access_token, _signed_in_resource=nil)
    social_authenticate(access_token) {}
  end

  def self.find_for_linkedin_oauth(access_token, _signed_in_resource=nil)
    social_authenticate(access_token) {}
  end

  def self.find_for_google_oauth2_oauth(access_token, _signed_in_resource=nil)
    social_authenticate(access_token) {}
  end

  def self.find_for_yahoo_oauth(access_token, _signed_in_resource=nil)
    social_authenticate(access_token) {}
  end

  def self.find_for_twitter_oauth(env, _signed_in_resource=nil)
    if user = User.where(:twitter_id => env["uid"]).first
      user
    else # Create a user with a stub password.
      user = User.new({:name => env["extra"]["access_token"].params[:screen_name],
                             :twitter_id => env["uid"]})
      user.save(:validate => false)
    end
    user
  end

  private
  def self.social_authenticate(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    unless user
      user = User.create(name: data["name"],
                         email: data["email"],
                         password: Devise.friendly_token[0,20])
      yield # Personalise the storage
    end
    user
  end
end
