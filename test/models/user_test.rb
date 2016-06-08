require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Test', email: 'test@test.com.br', password: '123456')
  end

  test 'should be valid user' do
    assert @user.valid?
  end

  test 'should not be valid user without name' do
    @user.name = ''
    assert_not @user.valid?
    assert_not_empty @user.errors[:name]
  end
  
  test 'should not be valid user with name bigger than 30' do
    big_name = 'A' * 31

    @user.name = big_name
    assert_not @user.valid?
    assert_not_empty @user.errors[:name]
  end

  test 'should not be valid user without email' do
    @user.email = ''
    assert_not @user.valid?
    assert_not_empty @user.errors[:email]
  end

  test 'should not be valid user with wrong email syntax' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com] 
    
    invalid_addresses.each do |invalid_address|
      message = "#{invalid_address.inspect} should be invalid"
      
      @user.email = invalid_address
      assert_not @user.valid?, message  
      assert_not_empty @user.errors[:email], message
    end  
  end
  
  test 'should not be valid user without password' do
    @user.password = ''
    assert_not @user.valid?
    assert_not_empty @user.errors[:password]
  end
  
  test 'should not be valid user with password smaller than 6' do
    @user.password = '12345'
    assert_not @user.valid?
    assert_not_empty @user.errors[:password]
  end

end
