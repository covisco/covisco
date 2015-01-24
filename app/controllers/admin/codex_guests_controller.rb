class Admin::CodexGuestsController < ApplicationController
  before_filter :verify_admin

  def index
    @codex_guests = CodexGuest.all
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

  def edit
    @codex_guest = CodexGuest.friendly.find(params[:id])
  end

  def update
    @codex_guest = CodexGuest.friendly.find(params[:id])

    if @codex_guest.update_attributes( user_params )
      redirect_to admin_codex_guests_path
    else
      render :edit
    end
  end

  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:codex_guests).permit(:first_name, :last_name,
                                         :title, :twitter,
                                         :facebook, :linkedin,
                                         :website, :link_video, :description,
                                         :link_audio, :avatar, :audio, :date_uploaded)
  end

  def verify_admin
    redirect_to '/' unless current_user.email = 'skid@skidvis.com'
  end
end
