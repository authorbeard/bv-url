module Api::V1
  class ShortenedUrlsController < ApplicationController
    def index
      @shortened_urls = ShortenedUrl.order(requests: :asc).limit(100)

      render json: @shortened_urls
    end

    def create
      @shortened_url = LinkShorteningService.perform(params[:orig_url])

      if @shortened_url.save
        render json: @shortened_url, status: :created
      else
        render json: @shortened_url.errors, status: :unprocessable_entity
      end
    end

    private
      def shortened_url_params
        params.permit(:key, :orig_url)
      end
  end
end