class PagesController < ApplicationController
  require 'yajl/http_stream'
  
  def index
    #redirect_to "http://www.last.fm/api/auth/?api_key=#{API_KEY}"
    unless params[:name].blank?
    
    end
  end
  
  def fruitify
    unless params[:name].blank?
      #@result = similarArtists URI::escape(params[:name])
        @hot = hotness URI::escape(params[:name])
        @bio = biography URI::escape(params[:name])
    end
  render :layout => 'application' 
  end

  def getloved
    unless params[:username].blank?
      
    end
    render :fruitify
  end
  
  
end
