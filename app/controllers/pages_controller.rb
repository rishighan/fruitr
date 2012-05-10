class PagesController < ApplicationController
  require 'yajl/http_stream'
  def index
    redirect_to "http://www.last.fm/api/auth/?api_key=#{API_KEY}"
    
  end
  
  def fruitify
    parser =Yajl::Parser.new
    url = URI.parse("http://ws.audioscrobbler.com/2.0/?method=artist.getSimilar&artist=#{params[:name]}&format=json&api_key=#{API_KEY}")
    @result = Yajl::HttpStream.get(url) 
    
    render :layout => 'application'
 end

end
