class InvitesController < ApplicationController
  def new
    @invites = Invite.where(:event_id => params[:event_id])
    @invite = Invite.new(:event_id => params[:event_id])
  end

  def create
    @invite = Invite.new(invite_params)
    redirect_to new_event_invite_path(@invite.event_id) if @invite.save
  end

  def show
    @invite = Invite.find(params[:id])
  end

  def edit
    @invite = Invite.find(params[:id])
  end

  def update
    @invite = Invite.find(params[:id])
    @invite.rsvp = true
    @invite.save
    redirect_to event_path(@invite.event)
  end

  private
    def invite_params
      params.require(:invite).permit(:name, :event_id, :rsvp)
    end
end