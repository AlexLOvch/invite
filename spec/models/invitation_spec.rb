# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  email      :string(255)      not null
#  link       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Invitation do
  before(:all) do
    @invitation=Invitation.create!(email: 'example@example.com')
    @invitation1=Invitation.create!(email: 'example1@example.com')
    @user=User.create!(email: 'example@example.com', password: '123456')
  end

 
  it { should validate_uniqueness_of(:link) }
  it { should validate_presence_of(:email)  }

  it "generate link" do
    expect(@invitation.link).to be
  end  

  it "generate unique link" do
    expect(@invitation.link).not_to eq(@invitation1.link)
  end  

  it "verify active link" do
    expect(Invitation.active?(@invitation1.link)).to be_true
    expect(Invitation.active?('1234')).not_to be_true
    expect(Invitation.active?(@invitation.link)).not_to be_true
  end  

  it "verify already registered user by link" do
    expect(Invitation.already_registered?(@invitation.link)).to be_true
    expect(Invitation.already_registered?(@invitation1.link)).not_to be_true
    expect(Invitation.already_registered?('1234')).not_to be_true
  end  



end
