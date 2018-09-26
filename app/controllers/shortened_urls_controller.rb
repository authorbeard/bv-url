class ShortenedUrlsController < ApplicationController
  before_action :get_redirect, only: :show
  def show
    redirect_to @orig_url
  end

  private
    def get_redirect
      key = params[:key].slice(0,3)
      url_record = ShortenedUrl.find_by(key: params[:key])
      url_record.nil? ? redirect_to root_path : @orig_url = url.orig_url
      @orig_url.increment!(:requests)
    end

    def shortened_url_params
      params.permit(:key, :orig_url)
    end
end
