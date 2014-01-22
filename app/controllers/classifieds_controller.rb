class ClassifiedsController < ApplicationController
  require "json"
  respond_to :json, :html
  
  def index
    @classifieds = Classified.all
    respond_with @classifieds
  end

  def update
    @classified = Classified.find_by_id(params[:id])
    #@classified.update_attributes(params[:classified])
    @classified.name = params[:name]
    @classified.description = params[:description]
    @classified.phone = params[:phone]
    @classified.price = params[:price]
    @classified.image = params[:image]
    @classified.save
    respond_with @classified
  end

  def create
    @classified = Classified.new()
    @classified.name = params[:name]
    @classified.description = params[:description]
    @classified.phone = params[:phone]
    @classified.price = params[:price]
    @classified.image = params[:image]
    @classified.save
    respond_with @classified
  end

  def destroy
    @classified = Classified.find_by_id(params[:id])
    @classified.destroy
    respond_with @classified
  end

end
