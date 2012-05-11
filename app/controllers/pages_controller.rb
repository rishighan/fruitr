class PagesController < ApplicationController
  require 'yajl/http_stream'
  before_filter :set_artist
  def index
    redirect_to "http://www.last.fm/api/auth/?api_key=#{API_KEY}"
    
  end
  
  def fruitify
    
    begin
      url = URI.parse("http://ws.audioscrobbler.com/2.0/?method=artist.getSimilar&artist=#{params[:name]}&format=json&api_key=#{API_KEY}")
      @result = Yajl::HttpStream.get(url)
    rescue NoMethodError
      
    end  
    render :layout => 'application'
 end

 def set_artist
   
  
 end
end
