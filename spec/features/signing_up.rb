require 'spec_helper'

describe "the sign up process", :type => :feature do
  before :all do
   @invitation=Invitation.create!(email: 'example@example.com')
  end


  it "redirect user without link into login path" do
    visit sign_up_path
    expect(page).to have_content 'Signup possible only by invitation!'
    expect(current_path).to eq log_in_path
  end

  it "show sign_up form for user with right link" do
    visit "#{sign_up_path}?link=#{@invitation.link}"
    expect(page).to have_content 'Sign up'
    expect(page).to have_field "user_email", with: @invitation.email
    expect(page).to have_field "user_password"
    expect(page).to have_field "user_password_confirmation"
  end


  it "sign_up user with right link" do
    visit "#{sign_up_path}?link=#{@invitation.link}"
    expect(page).to have_content 'Sign up'
    fill_in 'user_password', :with => '123456'
    fill_in 'user_password_confirmation', :with => '123456'
    click_button 'Sign up'
    expect(User.where(email: 'example@example.com').first).to be
    expect(page).to have_content 'Signed up!'
    expect(current_path).to eq profile_path
  end

  it "can't sign_up with not confirmed password" do
    visit "#{sign_up_path}?link=#{@invitation.link}"
    expect(page).to have_content 'Sign up'
    fill_in 'user_password', :with => '123456'
    fill_in 'user_password_confirmation', :with => '12345'
    click_button 'Sign up'
    expect(User.where(email: 'example@example.com').first).to be_nil
    expect(page).to have_content "Password doesn't match confirmation"
  end
  

end