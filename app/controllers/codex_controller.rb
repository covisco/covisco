class CodexController < ApplicationController
  def index
    @codex_guests = CodexGuest.order('date_uploaded desc')
  end

  def show
    @codex_guest = CodexGuest.friendly.find(params[:id])
    @video_link = @codex_guest.link_video.split('=').last
  end

  def feed
    @title = 'CoVis Codex'
    @guests = CodexGuest.order('date_uploaded desc')
    @update = @guests.first.updated_at unless @guests.empty?

    respond_to do |format|
      format.rss { render :layout => false }
    end
  end
end
