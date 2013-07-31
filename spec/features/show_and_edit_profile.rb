require 'spec_helper'

describe "the profile page", :type => :feature do
  before :each do
    @user=User.create!(email: 'example@example.com', password: '123456')
    visit log_in_path
    fill_in 'user_email', :with => 'example@example.com'
    fill_in 'user_password', :with => '123456'
    click_button 'Log in'
  end



  it "show user data" do
    visit root_path
    expect(page).to have_link('Profile')
    click_link 'Profile'
    expect(current_path).to eq profile_path
    expect(page).to have_field("user_email", with: "example@example.com")
  end

  it "changed user data" do
    visit profile_path
    expect(page).to have_field 'user_name'
    fill_in 'user_name', :with => 'example_name'
    fill_in 'user_addr', :with => 'example_addr'
    fill_in 'user_phone', :with => '04576456'
    click_button 'Update'
    expect(current_path).to eq profile_path
    expect(page).to have_content 'Successfully updated profile'
    expect(page).to have_field "user_name", with: "example_name"
    expect(page).to have_field "user_addr", with: "example_addr"
    expect(page).to have_field "user_phone", with: "04576456"
  end

  it "can change user password with right confirmation" do
    visit profile_path
    fill_in 'user_password', :with => 'example_psw'
    fill_in 'user_password_confirmation', :with => 'example_psw'
    click_button 'Update'
    expect(User.authenticate('example@example.com', 'example_psw')).to eq @user
  end  

  it "cannot change user password with wrong confirmation" do
    visit profile_path
    fill_in 'user_password', :with => 'example_psw'
    fill_in 'user_password_confirmation', :with => 'example_psw1'
    click_button 'Update'
    expect(page).to have_content "Password doesn't match confirmation"
    expect(User.authenticate('example@example.com', '123456')).to eq @user
  end  

  it "cannot change user password if leave it blank" do
    visit profile_path
    fill_in 'user_password', :with => ''
    fill_in 'user_password_confirmation', :with => ''
    click_button 'Update'
    expect(page).to have_content "Successfully updated profile."
    expect(User.authenticate('example@example.com', '123456')).to eq @user
  end  



end