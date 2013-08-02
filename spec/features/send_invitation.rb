require 'spec_helper'

describe "send invitation process", :type => :feature do

  it "admin can send invitation to unregistered user" do
    visit new_admin_invitation_path
    fill_in 'invitation_email', :with => 'example@example.com'
    click_button 'Create Invitation'
    expect(page).to have_content 'Successfully created invitation.'
    expect(ActionMailer::Base.deliveries.last.to).to eq ['example@example.com']
    link=Capybara.string(ActionMailer::Base.deliveries.last.body.encoded).find_link('link')
    expect(link[:href]).to end_with(Invitation.where(email: 'example@example.com').last.link)
  end
 
  it "admin cannot send invitation to registered user" do
    @user=User.create!(email: 'example1@example.com', password: '123456')
    ActionMailer::Base.deliveries.clear
    visit new_admin_invitation_path
    fill_in 'invitation_email', :with => 'example1@example.com'
    click_button 'Create Invitation'
    expect(page).to have_content 'This user already registered.'
    expect(ActionMailer::Base.deliveries.count).to eq 0
  end




end