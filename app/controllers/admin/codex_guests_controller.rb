class Admin::CodexGuestsController < ApplicationController
  before_filter :verify_admin

  def index

  end

  def new
    @codex_guest = CodexGuest.new
  end

  def create
    @codex_guest = CodexGuest.create( user_params )
    @codex_guest.date_uploaded = DateTime.now
    if @codex_guest.save
      redirect_to '/'
    else
      render :new
    end
  end

  def show

  end

  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:codex_guests).permit(:first_name, :last_name,
                                         :title, :twitter,
                                         :facebook, :linkedin,
                                         :website, :link_video,
                                         :link_audo, :avatar, :date_uploaded)
  end

  def verify_admin
    redirect_to '/' unless current_user.email = 'skid@skidvis.com'
  end
end
