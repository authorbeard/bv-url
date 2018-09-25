class ShortenedUrlsController < ApplicationController
  before_action :get_redirect, only: :show
  def show
    redirect_to @shortened_url.orig_url
  end

  private
    def get_redirect
      key = params[:key].slice(0,3)
      @shortened_url = ShortenedUrl.find_by(key: params[:key])
    end

    def shortened_url_params
      params.permit(:key, :orig_url)
    end
end
