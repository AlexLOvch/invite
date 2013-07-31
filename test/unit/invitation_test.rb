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

require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
