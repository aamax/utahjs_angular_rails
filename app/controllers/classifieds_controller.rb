class ClassifiedsController < ApplicationController
  require "json"
  respond_to :json, :html
  
  def index
    @classifieds = Classified.all
    respond_with @classifieds
  end

  def update
  end

  def create
  end

  def destroy
  end
end
