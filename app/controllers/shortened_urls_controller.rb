class ShortenedUrlsController < ApplicationController
  before_action :get_redirect, only: :show
  def show
    redirect_to @orig_url
  end

  private
    def get_redirect
      key = params[:key].slice(0,3)
      if ShortenedUrl.where(key: params[:key]).exists?
          @orig_url = ShortenedUrl.find_by(key: params[:key]).orig_url
      else
        redirect_to root_path and return
      end
      @orig_url.increment!(:requests)
    end

    def shortened_url_params
      params.permit(:key)
    end
end
