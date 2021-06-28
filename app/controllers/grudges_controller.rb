class GrudgesController < ApplicationController
    def index
    @grudges = Grudge.all
  end

  def show 
   @grudge = Grudge.find(params[:id])
  end
end
