class AnnouncementsController < ApplicationController
    def index
        render json: Announcement.all, status: :ok
    end

    def show
        announcement = find_announcement
        render json: announcement, status: :ok
    end

    def create
        announcement = Announcement.create!(announcement_params)
        render json: announcement, status: :created
    end

    def update 
        announcement = find_announcement
        announcement.update!(announcement_params)
        render json: announcement
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
