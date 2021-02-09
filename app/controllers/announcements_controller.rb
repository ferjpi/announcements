class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.all.order('created_at DESC')
  end

  def new
    @announcement = current_user.announcement.new
  end

  def create
    @announcement = current_user.announcement.new(announcement_params)
    if @announcement.save
      redirect_to announcements_index_path, notice: "Announcement created successfuly."
    else
      render :new, status: :unprocessable_entity   
    end
  end

  private
  def announcement_params
    params.require(:announcement).permit(:content, :expire, :seen)
  end
end
