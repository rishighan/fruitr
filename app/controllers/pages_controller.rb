class PagesController < ApplicationController

  
  def index
  unless params[:genre].blank?
    @search = search URI::escape(params[:genre]), URI::escape(params[:startyear]), URI::escape(params[:endyear])
  end
    unless params[:name].blank?
      # why did I just declare a hash, what the fuck was I thinking?
      #@hotness = hotness URI::escape(params[:name])
      @similar = similar URI::escape(params[:name])
      @hotArray, @famArray, @blogArray, @newsArray = Array.new(), Array.new(), Array.new(), Array.new()
      @artistImages = images URI::escape(params[:name])

    end
 end

end
