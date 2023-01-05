class AnnouncementsController < ApplicationController
    def index
        render json: Announcement.all
    end

    def show
        announcement = Announcement.find(params[:id])
        render json: announcement
    end
end
