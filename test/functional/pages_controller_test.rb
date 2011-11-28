require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get advertise" do
    get :advertise
    assert_response :success
  end

  test "should get display" do
    get :display
    assert_response :success
  end

  test "should get store" do
    get :store
    assert_response :success
  end

end
