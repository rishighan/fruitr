class PagesController < ApplicationController

  
  def index
    unless params[:name].blank?
      # why did I just declare a hash, what the fuck was I thinking?
      #@hotness = hotness URI::escape(params[:name])
      @similar = similar URI::escape(params[:name])
      @hotArray, @famArray = Array.new(), Array.new()
    end
 end

end
