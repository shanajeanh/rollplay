class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    authenticate_user!
    @character = Character.new
  end

  def create
    authenticate_user!
    @character = Character.new(character_params)
    @character.user = current_user
    if @character.save
      flash[:notice] = "Character added successfully"
      redirect_to @character
    else
      flash[:notice] = flash[:notice] = @character.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(
      :name,
      :character_race,
      :character_class,
      :description,
      :level,
      :appearance,
      :alignment,
      :deity,
      :speed,
      :str,
      :dex,
      :con,
      :int,
      :wis,
      :cha,
      :hp,
      :fort,
      :ref,
      :will,
      :bab
      )
  end
end
