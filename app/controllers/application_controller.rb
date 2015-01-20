class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_latest_codex_guest

  def get_latest_codex_guest
    @codex_guest = CodexGuest.last
  end
end
