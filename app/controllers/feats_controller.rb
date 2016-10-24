class FeatsController < ApplicationController
  def new
    authenticate_user!
    @character = Character.find(params[:id])
    @feat = Feat.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
