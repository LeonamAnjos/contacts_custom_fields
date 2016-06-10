require 'test_helper'

class ContactCustomFieldsControllerTest < ActionController::TestCase
  fixtures :users, :contact_custom_fields
  
  setup do
    @user = users :jhon
    @contact_custom_field = contact_custom_fields(:text_field)
    
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_custom_fields)
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

  test "should create contact_custom_field" do
    assert_difference('ContactCustomField.count') do
      post :create, contact_custom_field: { field_type: @contact_custom_field.field_type, name: @contact_custom_field.name, user_id: @contact_custom_field.user_id }
    end

    assert_redirected_to contact_custom_field_path(assigns(:contact_custom_field))
  end

  test "should show contact_custom_field" do
    get :show, id: @contact_custom_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact_custom_field
    assert_response :success
  end

  test "should update contact_custom_field" do
    patch :update, id: @contact_custom_field, contact_custom_field: { field_type: @contact_custom_field.field_type, name: @contact_custom_field.name, user_id: @contact_custom_field.user_id }
    assert_redirected_to contact_custom_field_path(assigns(:contact_custom_field))
  end

  test "should destroy contact_custom_field" do
    assert_difference('ContactCustomField.count', -1) do
      delete :destroy, id: @contact_custom_field
    end

    assert_redirected_to contact_custom_fields_path
  end
end
