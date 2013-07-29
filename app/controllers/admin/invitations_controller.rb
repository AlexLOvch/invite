class Admin::InvitationsController < ApplicationController
  layout 'admin'
  
  def index
    @invitations = Invitation.all
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(params[:invitation])
    if @invitation.save
      InvitationMailer.invite_email(@invitation).deliver
      redirect_to [:admin, @invitation], :notice => "Successfully created invitation."
    else
      render action: 'new'
    end
  end

end
