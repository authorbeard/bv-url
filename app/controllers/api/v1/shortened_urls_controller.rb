module Api::V1
  class ShortenedUrlsController < ApplicationController
    before_action :set_shortened_url, only: [:show, :update, :destroy]

    def index
      byebug
      @shortened_urls = ShortenedUrl.order(requests: :desc).limit(100)

      render json: @shortened_urls
    end

    def show
      redirect @shortened_url.orig_url
    end

    def create
      binding.pry
      @shortened_url = LinkShorteningService.perform(params[:orig_url])

      if @shortened_url.save
        render json: @shortened_url, status: :created
      else
        render json: @shortened_url.errors, status: :unprocessable_entity
      end
    end

    private
      def set_shortened_url
        @shortened_url = ShortenedUrl.find(params[:id])
      end

      def shortened_url_params
        params.require(:shortened_url).permit(:key, :orig_url, :title, :requests)
      end
  end
end