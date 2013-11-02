class UrlsController < ApplicationController
  def index
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.find_or_create_by(original_url: params[:url][:original_url])
    if @url
      redirect_to url_path(@url)
    else
      redirect_to root_url
    end
  end

  def show
    @url = Url.friendly.find(params[:id])
  end

  def redirect
    url = Url.find_by_longified_url(params[:longified_url])

    if url
      url.visits += 1
      url.save
      redirect_to(url.original_url)
    else
      redirect_to root_path
    end
  end
end
