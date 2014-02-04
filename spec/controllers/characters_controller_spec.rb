require File.dirname(__FILE__) + '/../spec_helper'
include Devise::TestHelpers

describe CharactersController do |variable|
  def mock_user(stubs={})
    @user = Fabricate(:user, stubs)
  end

  def log_in_test_user
    mock_user
    request.env['warden'] = mock(Warden, :authenticate => @user, :authenticate! => @user)
  end

  context "with valid user" do
    before :each do
      log_in_test_user
      @character_attrs = Fabricate.attributes_for(:character)
    end

    it "redirects and displays success message on create" do
      post :create, :user_id => @user, :character => @character_attrs
      response.should be_redirect
      flash[:notice].should == 'Character was successfully created.'
    end
  end
end
