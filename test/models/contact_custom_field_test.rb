require 'test_helper'

class ContactCustomFieldTest < ActiveSupport::TestCase
  fixtures :users, :contact_custom_fields
  
  def setup
    @text_field = contact_custom_fields(:text_field)
    @text_area = contact_custom_fields(:text_area)
    @combo_box = contact_custom_fields(:combo_box)
  end

  test 'should be valid custom fields' do
    assert @text_field.valid?, 'Text Field should be valid'
    assert @text_area.valid?, 'Text Area should be valid'
    assert @combo_box.valid?, 'ComboBox should be valid'
  end
  
  test 'should be invalid custom fields without name' do
    @text_field.name = @text_area.name = @combo_box.name = ''
    
    assert_not @text_field.valid?, 'Text Field should be invalid'
    assert_not @text_area.valid?, 'Text Area should be invalid'
    assert_not @combo_box.valid?, 'ComboBox should be invalid'
  end
  
  test 'should be invalid custom fields without field_type' do
    @text_field.field_type = @text_area.field_type = @combo_box.field_type = ''
    
    assert_not @text_field.valid?, 'Text Field should be invalid'
    assert_not @text_area.valid?, 'Text Area should be invalid'
    assert_not @combo_box.valid?, 'ComboBox should be invalid'
  end
  
  test 'should be invalid custom fields with unknown type' do
    @text_field.field_type = 'unknow_field_type'
    
    assert_not @text_field.valid?, 'Custom field should be invalid'
  end

  test 'should be invalid custom combobox fields without options' do
    @text_field.combobox_options = @text_area.combobox_options = @combo_box.combobox_options = ''
    
    assert @text_field.valid?, 'Text Field should be valid'
    assert @text_area.valid?, 'Text Area should be valid'
    assert_not @combo_box.valid?, 'ComboBox should be invalid'
  end
  
  test 'should be invalid custom fields without user' do
    @text_field.user_id = @text_area.user_id = @combo_box.user_id = nil
    
    assert_not @text_field.valid?, 'Text Field should be invalid'
    assert_not @text_area.valid?, 'Text Area should be invalid'
    assert_not @combo_box.valid?, 'ComboBox should be invalid'
  end

  test 'should return custom fields of given user' do
    jhon = users(:jhon)
    frank = users(:frank)
    
    @text_field.user_id = @text_area.user_id = jhon.id
    @combo_box.user_id = frank.id
    
    @text_field.save
    @text_area.save
    @combo_box.save
  
    assert_equal 2, ContactCustomField.of_user(jhon).size
    assert_equal 1, ContactCustomField.of_user(frank).size
  end

end

