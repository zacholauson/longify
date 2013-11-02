class LongifyController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    begin
      url = Url.find_or_create_by!(original_url: params[:original_url])
    rescue
      flash[:notice] = "Invalid Url"
      redirect_to new_longified_path
    end
    redirect_to show_longified_path(url)
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
