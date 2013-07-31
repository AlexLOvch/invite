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

class Invitation < ActiveRecord::Base
  attr_accessible :email
  before_save :generate_link
  validates_presence_of :email  
  validates_uniqueness_of :link
  
  def self.active?(link)
    invite = where(link: link).first
    invite && User.where(email: invite.email).empty? 
  end  

  def self.already_registered?(link)
    invite = where(link: link).first
    invite && User.where(email: invite.email).present? 
  end  

  private

  def generate_link
    link=SecureRandom.hex(64)  
    while Invitation.where(link: link).present? do 
      link=SecureRandom.hex(64)
    end
    self.link=link
  end  

end
