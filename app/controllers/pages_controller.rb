class PagesController < ApplicationController


 def genre
  unless params[:genre].blank?
    @search = search URI::escape(params[:genre]), URI::escape(params[:startyear]), URI::escape(params[:endyear])
    @hotness,@fam = Array.new(), Array.new()
  end
 end

  def basic
  unless params[:name].blank?
     #@hotness = hotness URI::escape(params[:name])
     @similar = similar URI::escape(params[:name])
     @hotArray, @famArray, @blogArray, @newsArray = Array.new(), Array.new(), Array.new(), Array.new()
     @artistImages = images URI::escape(params[:name])

   end
  end

end
