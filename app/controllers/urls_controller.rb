class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    #create short_url
    #convert long_url to short_url

    #check for valid url
    if valid_url?(params[:url][:long_url])
      @url = Url.new(long_url: params[:url][:long_url])
      @url.short_url = SecureRandom.base64[0..8]

      @url.save
      redirect_to urls_path

    else
      @errors = "your url is invalid"
      render new_url_path
    end
  end


  private
  def url_params
    params.require(:url).permit(:long_url)
  end

  def valid_url?(str)
		# return true if not valid, otherwise false
		if str =~ /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/
			puts "valid url = #{str}"
			return true
		else
			return false
		end
  end


end
