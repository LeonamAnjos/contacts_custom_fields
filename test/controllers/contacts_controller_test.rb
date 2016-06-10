require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  fixtures :users, :contacts
  
  setup do
    @user = users :jhon
    @contact = contacts :darth_vader

    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end
  
  test "should not get index if not signed in" do
    sign_out @user

    get :index
    assert_response :redirect
    assert_redirected_to controller: 'devise/sessions', action: 'new'
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    email = "test@email.com"
    
    assert_difference('Contact.count') do
      post :create, contact: { email: email, name: @contact.name, user_id: @contact.user_id }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should show contact" do
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    patch :update, id: @contact, contact: { email: @contact.email, name: @contact.name }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
  
end
