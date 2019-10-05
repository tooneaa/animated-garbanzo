class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger]= "You have entered an empty search"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "You have entered a wrong ticker symbol" unless @stock
      end

    respond_to do |format|
    format.js{render partial:'users/results'}
    end
  end

end
