# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string(255)      not null
#  encrypted_password :string(255)      not null
#  salt               :string(255)      not null
#  name               :string(255)
#  phone              :string(255)
#  addr               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'spec_helper'

describe User do
  before(:all) do
    @user=User.create!(email: 'example@example.com', password: '123456')
  end

  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it "generate salt" do
     expect(@user.salt).to be 
  end  


  it "encrypt password" do
    expect(@user.encrypted_password).to eq BCrypt::Engine.hash_secret('123456', @user.salt)
  end  

  it "verify valid/invalid login and password" do
    expect(User.authenticate('example@example.com', '123456')).to eq @user
    expect(User.authenticate('example@example.com', '1234561')).to be_nil
    expect(User.authenticate('example', '123456')).to be_nil
  end  

end
