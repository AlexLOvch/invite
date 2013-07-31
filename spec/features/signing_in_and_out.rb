require 'spec_helper'

describe "the signin process", :type => :feature do
  before :all do
    User.create!(email: 'example@example.com', password: '123456')
  end


  it "redirect unregistered user into root path" do
    visit root_path
    expect(current_path).to eq log_in_path
  end


  it "signs registered user in" do
    visit log_in_path
    fill_in 'user_email', :with => 'example@example.com'
    fill_in 'user_password', :with => '123456'
    click_button 'Log in'
    expect(page).to have_content 'Logged in!'
    expect(current_path).to eq root_path
  end
  
  it "not allow unregistered user" do
    visit log_in_path
    fill_in 'user_email', :with => 'example1@example.com'
    fill_in 'user_password', :with => '123456'
    click_button 'Log in'
    expect(page).to have_content 'Invalid email or password'
    expect(current_path).to eq log_in_path
  end

  it "not allow login to registered user with wrong password" do
    visit log_in_path
    fill_in 'user_email', :with => 'example1@example.com'
    fill_in 'user_password', :with => '1234567'
    click_button 'Log in'
    expect(page).to have_content 'Invalid email or password'
    expect(current_path).to eq log_in_path
  end


  it "sign out logined user" do
    visit log_in_path
    fill_in 'user_email', :with => 'example@example.com'
    fill_in 'user_password', :with => '123456'
    click_button 'Log in'
    expect(page).to have_content 'Logout'
    click_link 'Logout'
    expect(current_path).to eq log_in_path
  end


end