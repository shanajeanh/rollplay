class WeaponsController < ApplicationController
  def new
    authenticate_user!
    @character = Character.find(params[:character_id])
    @weapon = Weapon.new
  end

  def create
    authenticate_user!
    @character = Character.find(params[:character_id])
    @weapon = Weapon.new(weapon_params)
    @weapon.character = @character
    if @weapon.save
      flash[:notice] = 'Weapon added successfully'
      redirect_to @character
    else
      flash[:notice] = @weapon.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    authenticate_user!
    @weapon = Weapon.find(params[:id])
    @character = @weapon.character
  end

  def update
    authenticate_user!
    @weapon = Weapon.find(params[:id])
    @character = @weapon.character
    if @weapon.update_attributes(weapon_params)
      flash[:notice] = 'Weapon successfully edited'
      redirect_to @character
    else
      flash[:notice] = @weapon.errors.full_messages.join(', ')
      redirect_to edit_character_weapon_path(@character, @weapon)
    end
  end

  def destroy
    authenticate_user!
    weapon = Weapon.find(params[:id])
    @character = weapon.character
    weapon.destroy
    flash[:notice] = 'Weapon deleted'
    redirect_to @character
  end

  private
  def weapon_params
    params.require(:weapon).permit(
      :name,
      :damage,
      :bonus,
      :crit,
      :range,
      :size,
      :damage_type,
      :special,
      :use_dex
      )
  end
end
