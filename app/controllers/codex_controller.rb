class CodexController < ApplicationController
  def index
    @codex_guests = CodexGuest.all
  end

  def show
    @codex_guest = CodexGuest.friendly.find(params[:id])
    @video_link = @codex_guest.link_video.split('=').last
  end
end
