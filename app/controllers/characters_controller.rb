class CharactersController < ApplicationController
  def index
    if logged_in?
      @characters = current_user.characters
    end
  end

  def show
    @character = Character.find(params[:id])
    @skills = Skill.all
    @feats = @character.feats
    @spells = @character.spells
    @class_abilities = @character.class_abilities
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
      flash[:notice] = 'Character added successfully'
      redirect_to @character
    else
      flash[:notice] = flash[:notice] = @character.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    authenticate_user!
    @character = Character.find(params[:id])
    @skills = @character.skills
  end

  def update
    authenticate_user!
    @character = Character.find(params[:id])
    if @character.update_attributes(character_params)
      flash[:notice] = 'Character edited successfully'
      redirect_to @character
    else
      flash[:notice] = @character.errors.full_messages.join(', ')
      render 'edit'
    end
  end

  def destroy
    Character.find(params[:id]).destroy
    flash[:notice] = 'Character deleted'
    redirect_to root_path
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
      :bab,
      :caster,
      ranks_attributes: [
        :id,
        :class_skill,
        :added_ranks,
        :skill_id,
        :character_id
        ]
      )
  end
end
