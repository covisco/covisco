class CodexController < ApplicationController
  def index
    @codex_guests = CodexGuest.all
  end

  def show
    @codex_guest = CodexGuest.friendly.find(params[:id])
    @video_link = @codex_guest.link_video.split('=').last
  end

  def feed
    @title = 'CoVis Codex'
    @guests = CodexGuest.order('updated_at desc')
    @update = @guests.first.updated_at unless @guests.empty?

    respond_to do |format|
      format.atom {render :layout => false}
      format.rss {redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end
end
