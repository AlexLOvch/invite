require 'spec_helper'

describe "the profile page", :type => :feature do
  before :each do
    @user=User.create!(email: 'example@example.com', password: '123456')
    visit log_in_path
    fill_in 'user_email', :with => 'example@example.com'
    fill_in 'user_password', :with => '123456'
    click_button 'Log in'
  end


  it "show reminder then phone not fill" do
    visit root_path
    expect(page).to have_content("Please, fill out your phone")
  end

  it "don't show reminder then phone filled" do
    visit profile_path
    fill_in 'user_phone', :with => '04576456'
    click_button 'Update'
    visit root_path
    expect(page).not_to have_content("Please, fill out your phone")
  end

end