module Api::V1
  class ShortenedUrlsController < ApplicationController
    before_action :set_shortened_url, only: [:show, :update, :destroy]

    # GET /shortened_urls
    def index
      @shortened_urls = ShortenedUrl.order(requests: :desc).limit(100)

      render json: @shortened_urls
    end

    # GET /shortened_urls/1
    def show
      redirect @shortened_url.orig_url
    end

    # POST /shortened_urls
    def create
      @shortened_url = LinkShorteningService.perform(params[:orig_url])

      if @shortened_url.save
        render json: @shortened_url, status: :created
      else
        render json: @shortened_url.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /shortened_urls/1
    # def update
    #   if @shortened_url.update(shortened_url_params)
    #     render json: @shortened_url
    #   else
    #     render json: @shortened_url.errors, status: :unprocessable_entity
    #   end
    # end

    # DELETE /shortened_urls/1
    # def destroy
    #   @shortened_url.destroy
    #   if @shortened_url.destroy
    #     head :no_content, status: :ok
    #   else
    #     render json: @shortened_url.errors, status: :unprocessable_entity
    #   end
    # end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_shortened_url
        @shortened_url = ShortenedUrl.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def shortened_url_params
        params.require(:shortened_url).permit(:key, :orig_url, :title, :requests)
      end
  end
end