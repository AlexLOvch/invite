require 'spec_helper'

describe User do
  before(:all) do
    @user=User.create!(email: 'example@example.com', password: '123456')
  end

  after(:all) do
    @user.destroy
  end
  
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
