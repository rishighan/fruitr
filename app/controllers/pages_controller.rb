class PagesController < ApplicationController
  require 'yajl/http_stream'
  
  def index
    redirect_to "http://www.last.fm/api/auth/?api_key=#{API_KEY}"
    
  end
  
  def fruitify
    unless params[:name].blank?
      url = URI.parse("http://ws.audioscrobbler.com/2.0/?method=artist.getSimilar&artist=#{params[:name]}&format=json&api_key=#{API_KEY}")
      @result = Yajl::HttpStream.get(url)
    end
  render :layout => 'application' 
  end

  def getloved
    unless params[:username].blank?
      url = URI.parse("http://ws.audioscrobbler.com/2.0/?method=user.getlovedtracks&user=#{params[:username]}&format=json&api_key=#{API_KEY}")
      @lovedtracks = Yajl::HttpStream.get(url)
    end
    render :fruitify
  end
  
  
end
