class AnnouncementsController < ApplicationController
    def index
        render json: Announcement.all
    end

    def show
        announcement = find_announcement
        render json: announcement
    end

    def create
        announcement = Announcement.create!(announcement_params)
        render json: announcement
    end

    def update 
        a
    end

    def destroy 

    end

    private

    def find_announcement
        Announcement.find(params[:id])
    end

    def announcement_params
        params.permit(:title, :content)
    end
end
