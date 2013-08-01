class InvitationMailer < ActionMailer::Base


  def invite_email(invitation)
    @invitation = invitation
    mail(:to => invitation.email,  :subject => 'Invitation to sign in')
  end


end
