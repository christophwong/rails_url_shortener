class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.get_short_url
    if @url.save
      redirect_to :root
    else
      render :new
    end
  end

  def redirect
    url = Url.find_by(short_url: params[:short_url])
    redirect_to "http://#{url.url}"
  end

  private

  def url_params
    params.require(:url).permit(:url)
  end
end
