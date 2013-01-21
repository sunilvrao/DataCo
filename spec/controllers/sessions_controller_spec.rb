require 'spec_helper'

describe SessionsController do

  before(:all) do
    @user = FactoryGirl.create(:user)
  end

  describe "Callback from Oauth2 applications" do
    it "should authenticate user and redirects to home page with success message" do
      User.stubs(:find_for_facebook_oauth).with(any_parameters).returns(@user)
      post :create, {'provider' => "facebook"}
      response.should redirect_to(root_url)
      flash[:notice].should eq("Successfully authenticated from facebook account.")
    end

    it "non authenticated user should redirect to sign in page" do
      User.stubs(:find_for_facebook_oauth).with(any_parameters).returns(User.new)
      post :create, {'provider' => "facebook"}
      response.should redirect_to(new_user_registration_url)
    end
  end

end
