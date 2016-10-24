class FeatsController < ApplicationController
  def new
    authenticate_user!
    @character = Character.find(params[:character_id])
    @feat = Feat.new
  end

  def create
    authenticate_user!
    @character = Character.find(params[:character_id])
    @feat = Feat.new(feat_params)
    @feat.character = @character
    if @feat.save
      flash[:notice] = 'Feat added successfully'
      redirect_to @character
    else
      flash[:notice] = @feat.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    authenticate_user!
    @feat = Feat.find(params[:id])
    @character = @feat.character
  end

  def update
    authenticate_user!
    @feat = Feat.find(params[:id])
    @character = @feat.character
    if @feat.update_attributes(feat_params)
      flash[:notice] = 'Feat successfully edited'
      redirect_to @character
    else
      flash[:notice] = @feat.errors.full_messages.join(', ')
      redirect_to edit_character_feat_path(@character, @feat)
    end
  end

  def destroy
    authenticate_user!
    feat = Review.find(params[:id])
    @character = feat.character
    feat.destroy
    flash[:notice] = 'Feat successfully deleted'
    redirect_to @character
  end

  private
  def feat_params
    params.require(:feat).permit(
      :title,
      :feat_type,
      :prerequisites,
      :summary,
      :description,
      :benefit,
      :special
      )
  end

end
