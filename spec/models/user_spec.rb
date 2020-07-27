require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should not be saved to the database if the password field is blank' do
     
      @user = User.create(firstname:"Samantha", lastname:"Gadet", email: "samantha.gadet@gmail.com", password: "", password_confirmation: "abcdef")
     
      expect(User.all).not_to include(@user)
      
    end
    it 'should not be saved to the database if the password confirmation field is blank' do
     
      @user = User.create(firstname:"Samantha", lastname:"Gadet", email: "samantha.gadet@gmail.com", password: "abcdef", password_confirmation: "")
     
      expect(User.all).not_to include(@user)
      
    end
    it 'should not be saved to the database if the password and password confirmation don\'t match' do
     
      @user = User.create(firstname:"Samantha", lastname:"Gadet", email: "samantha.gadet@gmail.com", password: "abcdef", password_confirmation: "fedcba")
     
      expect(User.all).not_to include(@user)
      
    end
    it 'should not be saved to the database if the email already exists' do
     
      @user1 = User.create(firstname:"Test1", lastname:"1", email: "test@test.com", password: "abcdef", password_confirmation: "abcdef")
      @user2 = User.create(firstname:"Test2", lastname:"2", email: "TEST@TEST.com", password: "fedcba", password_confirmation: "fedcba")
      
      expect(User.all).not_to include(@user2)
      
    end
    it 'should not be saved to the database if the firstname field is blank' do
     
      @user = User.create(firstname:"", lastname:"1", email: "test@test.com", password: "abcdef", password_confirmation: "abcdef")
      
      expect(User.all).not_to include(@user)
      
    end
    it 'should not be saved to the database if the lastname field is blank' do
     
      @user = User.create(firstname:"test", lastname:"", email: "test@test.com", password: "abcdef", password_confirmation: "abcdef")
      
      expect(User.all).not_to include(@user)
      
    end
    it 'should not be saved to the database if the email field is blank' do
     
      @user = User.create(firstname:"test", lastname:"1", email: "", password: "abcdef", password_confirmation: "abcdef")
      
      expect(User.all).not_to include(@user)
      
    end
    it 'should not be saved to the database if the password length is inferior to 6 characters' do
     
      @user = User.create(firstname:"test", lastname:"1", email: "test@test.com", password: "abcd", password_confirmation: "abcd")
      
      expect(User.all).not_to include(@user)
      
    end
  end
  describe '.authenticate_with_credentials' do
    it 'should return the user if the user is successfully authenticated' do
     
      @user = User.create(firstname:"James", lastname:"Bond", email: "j.bond@gmail.com", password: "000007", password_confirmation: "000007")
      
      expect(User.authenticate_with_credentials("j.bond@gmail.com", "000007")).to eq(@user)
      
    end
    it 'should return nil if the user is not authenticated' do
     
      @user = User.create(firstname:"James", lastname:"Bond", email: "j.bond@gmail.com", password: "000007", password_confirmation: "000007")
      
      expect(User.authenticate_with_credentials("j.bond@gmail.com", "000006")).to eq(nil)
      
    end
    it 'should authenticate the user if spaces are typed before/after their email address' do
     
      @user = User.create(firstname:"James", lastname:"Bond", email: "j.bond@gmail.com", password: "000007", password_confirmation: "000007")
      
      expect(User.authenticate_with_credentials("  j.bond@gmail.com  ", "000007")).to eq(@user)
      
    end
    it 'should authenticate the user even if wrong cases are typed in the email address' do
     
      @user = User.create(firstname:"Example", lastname:"Domain", email: "eXample.domain.COM", password: "000007", password_confirmation: "000007")
      
      expect(User.authenticate_with_credentials("EXAMPLe.DOMAIN.Com", "000007")).to eq(@user)
      
    end
  end

end
