class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @codex_guest = CodexGuest.new
  end
end
