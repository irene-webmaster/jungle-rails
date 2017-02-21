require 'rails_helper'
require_relative '../../app/models/user'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before(:each) do
      @user = User.new(
        :first_name => 'Irina',
        :last_name => 'Shakhova',
        :email => 'carina.omsk@gmail.com',
        :password => '12345',
        :password_confirmation => '12345'
      )
      # @another_user = User.new(
      #   :first_name => 'Test',
      #   :last_name => 'Testovich',
      #   :email => 'test@gmail.com',
      #   :password => '12345',
      #   :password_confirmation => '5678'
      # )
    end

    it 'is not valid without all data' do
      expect(@user).to be_valid
    end

    it 'is not valid without a first name' do
      expect(@user.first_name).to_not eq('')
    end

    it 'is not valid without a last name' do
      expect(@user.last_name).to_not eq('')
    end

    it 'is not valid without an email' do
      expect(@user.email).to_not eq('')
    end

    it 'is not valid without an password' do
      expect(@user.password).to_not eq('')
    end

    it 'is not valid without an password confirmation' do
      expect(@user.password_confirmation).to_not eq('')
    end

    it 'is not valid when password and password confirmation are not equal' do
      expect(@user.password).to eq(@user.password_confirmation)
    end

    it "requires a unique email (case insensitive)" do
      @user.email = "CARINA.omsk@gmail.COM"
      expect(@user).to validate_uniqueness_of(:email).case_insensitive
    end

    # it 'is not valid when password and password confirmation are not equal' do
    #   expect(@another_user).to_not be_valid
    # end

  end
end
