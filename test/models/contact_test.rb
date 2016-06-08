require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  def setup
    @contact = Contact.new(name: 'Test', email: 'test@test.com.br')
  end

  test 'should be valid contact' do
    assert @contact.valid?
  end

  test 'should not be valid contact without name' do
    @contact.name = ''
    assert_not @contact.valid?
    assert_not_empty @contact.errors[:name]
  end
  
  test 'should not be valid contact with name bigger than 50' do
    big_name = 'A' * 51

    @contact.name = big_name
    assert_not @contact.valid?
    assert_not_empty @contact.errors[:name]
  end

  test 'should not be valid contact without email' do
    @contact.email = ''
    assert_not @contact.valid?
    assert_not_empty @contact.errors[:email]
  end

  test 'should not be valid contact with wrong email syntax' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com] 
    
    invalid_addresses.each do |invalid_address|
      message = "#{invalid_address.inspect} should be invalid"
      
      @contact.email = invalid_address
      assert_not @contact.valid?, message  
      assert_not_empty @contact.errors[:email], message
    end  
  end
  

end
