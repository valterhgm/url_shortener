class ShortenerController < ApplicationController

  def show
    @shortener = Shortener.find_by_id(params[:id])
  end

  def new; end

  def create
    shortener = Shortener.find_by(long_url: params[:long_url])
    if shortener.present?
      redirect_to shortener_path(shortener)
    else
      verified_long_url = verify_protocol params[:long_url]
      shortener = Shortener.new(long_url: verified_long_url)
      shortener.save
      redirect_to shortener_path(shortener)
    end
  end

  def redirect_shortner
    shortener = Shortener.find_by_short_url(params[:shortener])
    redirect_to shortener.long_url
  end

  private

  def verify_protocol long_url
    unless long_url[/\Ahttp(s)?:\/\//]
      long_url = "http://#{long_url}"
    end
    long_url
  end

end
