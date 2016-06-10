require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  test "should get home#index" do
    get :index
    assert_response :success
    assert_select "title", "Contacts Custom Fields Sample App"
  end
  
end
