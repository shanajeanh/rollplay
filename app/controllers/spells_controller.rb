class SpellsController < ApplicationController
  def new
    authenticate_user!
    @character = Character.find(params[:character_id])
    @spell = Spell.new
  end

  def create
    authenticate_user!
    @character = Character.find(params[:character_id])
    @spell = Spell.new(spell_params)
    @spell.character = @character
    if @spell.save
      flash[:notice] = 'Spell added successfully'
      redirect_to @character
    else
      flash[:notice] = @spell.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    authenticate_user!
    @spell = Spell.find(params[:id])
    @character = @spell.character
  end

  def update
    authenticate_user!
    @spell = Spell.find(params[:id])
    @character = @spell.character
    if @spell.update_attributes(spell_params)
      flash[:notice] = 'Spell successfully edited'
      redirect_to @character
    else
      flash[:notice] = @spell.errors.full_messages.join(', ')
      redirect_to edit_character_spell_path(@character, @spell)
    end
  end

  def destroy
    authenticate_user!
    spell = Spell.find(params[:id])
    @character = spell.character
    spell.destroy
    flash[:notice] = 'Spell deleted'
    redirect_to @character
  end

  private
  def spell_params
    params.require(:spell).permit(
      :title,
      :level,
      :summary,
      :range,
      :duration,
      :spell_save,
      :description
      )
  end
end
