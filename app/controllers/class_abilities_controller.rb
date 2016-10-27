class ClassAbilityController < ApplicationController
  def new
    authenticate_user!
    @character = Character.find(params[:character_id])
    @class_ability = ClassAbility.new
  end

  def create
    authenticate_user!
    @character = Character.find(params[:character_id])
    @class_ability = ClassAbility.new(class_ability_params)
    @class_ability.character = @character
    if @class_ability.save
      flash[:notice] = 'Class ability added successfully'
      redirect_to @character
    else
      flash[:notice] = @class_ability.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    authenticate_user!
    @class_ability = ClassAbility.find(params[:id])
    @character = @class_ability.character
  end

  def update
    authenticate_user!
    @class_ability = ClassAbility.find(params[:id])
    @character = @class_ability.character
    if @class_ability.update_attributes(class_ability_params)
      flash[:notice] = 'Class ability successfully edited'
      redirect_to @character
    else
      flash[:notice] = @class_ability.errors.full_messages.join(', ')
      redirect_to edit_character_class_ability_path(@character, @class_ability)
    end
  end

  def destroy
    authenticate_user!
    class_ability = ClassAbility.find(params[:id])
    @character = class_ability.character
    class_ability.destroy
    flash[:notice] = 'Class ability deleted'
    redirect_to @character
  end

  private
  def class_ability_params
    params.require(:class_ability).permit(
      :title,
      :description
      )
  end

end
