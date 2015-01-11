class Admin::CodexGuestsController < ApplicationController
  def index

  end

  def new
    @codex_guest = CodexGuest.new
  end

  def create
    @codex_guest = CodexGuest.create( user_params )
  end

  def show

  end

  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:codex_guests).permit(:avatar)
  end
end
