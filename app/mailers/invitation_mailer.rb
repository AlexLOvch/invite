class InvitationMailer < ActionMailer::Base
  default from: "noreply@lisa.flyrouter.net"
  default_url_options[:host]="lisa.flyrouter.net:3505"


  def invite_email(invitation)
    @invitation = invitation
    mail(:to => invitation.email,  :subject => 'Invitation to sign in')
  end


end
