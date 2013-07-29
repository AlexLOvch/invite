class InvitationMailer < ActionMailer::Base
  default from: "from@example.com"
  default_url_options[:host]="example.com"


  def invite_email(invitation)
    @invitation = invitation
    mail(:to => invitation.email,  :subject => 'Invitation to sign in')
  end


end
