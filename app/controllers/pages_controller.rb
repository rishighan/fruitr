class PagesController < ApplicationController
  require 'yajl/http_stream'
  
  def index
    #redirect_to "http://www.last.fm/api/auth/?api_key=#{API_KEY}"
    unless params[:name].blank?
    
    end
  end
  
  def fruitify
    unless params[:name].blank?
      # why did I just declare a hash, what the fuck was I thinking?
      @similar = similar URI::escape(params[:name])
      @similar["response"]["artists"].each do |artist|
        @artists = {artist["name"] => hotness(URI::escape(artist["name"]))}  
      end
  
    end
    render :layout => 'application' 
  end

  def getloved
    unless params[:username].blank?
      
    end
    render :fruitify
  end
  
  
end
