class Admin::InvitationsController < ApplicationController
  layout 'admin'
  
  def index
    @invitations = Invitation.order('created_at desc').page(params[:page])
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def new
    @invitation = Invitation.new
  end

  def create
    if User.where(email: params[:invitation][:email]).present?
      redirect_to new_admin_invitation_path, :flash => { :error => "This user already registered."}
    else  
      @invitation = Invitation.new(params[:invitation])
      if @invitation.save
        InvitationMailer.invite_email(@invitation).deliver
        redirect_to [:admin, @invitation], :notice => "Successfully created invitation."
      else
        redirect_to new_admin_invitation_path
      end
    end  
  end

end
