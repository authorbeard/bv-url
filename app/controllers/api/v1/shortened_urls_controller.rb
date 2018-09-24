module Api::V1
  class ShortenedUrlsController < ApplicationController
    before_action :get_redirect, only: :show

    def index
      byebug
      @shortened_urls = ShortenedUrl.order(requests: :desc).limit(100)

      render json: @shortened_urls
    end

    def show
      redirect_to @shortened_url.orig_url
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
      def get_redirect
        @shortened_url = ShortenedUrl.find_by(key: params[:key])
      end

      def shortened_url_params
        params.permit(:key, :orig_url, :title, :requests)
      end
  end
end