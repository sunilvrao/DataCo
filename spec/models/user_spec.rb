require 'spec_helper'

describe User do
  before(:each) do
    @access_token = mock('object')
    @access_token.stubs(:info).returns({'provider' => "facebook", 'uid' => "100000816800978", 'email' => "a@b.com", 'name' => "Prasath Venkatraman"})
  end
  #Class methods test goes here

  context "New user" do
    it "should create user for facebook authentication" do
      User.find_for_facebook_oauth(@access_token).email.should eq("a@b.com")
    end

    it "should create user for linkedin authentication" do
      User.find_for_linkedin_oauth(@access_token).email.should eq("a@b.com")
    end

    it "should create user for google authentication" do
      User.find_for_google_oauth2_oauth(@access_token).email.should eq("a@b.com")
    end

    it "should create user for yahoo authentication" do
      User.find_for_yahoo_oauth(@access_token).email.should eq("a@b.com")
    end

    it "should create user for twitter authentication" do
      mock_obj = mock('object')
      mock_obj.stubs(:params).returns({:screen_name => "abc"})
      env = {'uid' => "123", 'extra' => {'access_token' => mock_obj}}
      User.find_for_twitter_oauth(env).twitter_id.should eq("123")
    end
  end

  context "Existing user" do
    before(:all) do
      @user = User.create(:email => "a@b.com", :password => 123456, :password_confirmation => 123456)
    end
    it "should find the existing user and return the user object for facebook authentication" do
      User.find_for_facebook_oauth(@access_token).email.should eq("a@b.com")
    end

    it "should find the existing user and return the user object for linkedin authentication" do
      User.find_for_linkedin_oauth(@access_token).email.should eq("a@b.com")
    end

    it "should find the existing user and return the user object for google authentication" do
      User.find_for_google_oauth2_oauth(@access_token).email.should eq("a@b.com")
    end

    it "should find the existing user and return the user object for yahoo authentication" do
      User.find_for_yahoo_oauth(@access_token).email.should eq("a@b.com")
    end

    it "should return user for twitter authentication" do
      User.create(name: "abc", twitter_id: "123", password: Devise.friendly_token[0,20])
      mock_obj = mock('object')
      mock_obj.stubs(:params).returns({:screen_name => "abc"})
      env = {'uid' => "123", 'extra' => {'access_token' => mock_obj}}
      User.find_for_twitter_oauth(env).twitter_id.should eq("123")
    end
  end

end
