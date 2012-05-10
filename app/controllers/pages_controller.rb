class PagesController < ApplicationController
  def index
    redirect_to "http://www.last.fm/api/auth/?api_key=#{API_KEY}"
    
  end
  
  def fruitify
    @similarArtists = ActiveSupport::JSON.decode("http://ws.audioscrobbler.com/2.0/?method=artist.getSimilar&artist=#{params[:name]}&format=json&api_key=#{API_KEY}")
  
    render :layout => 'application'
 end

end
