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
  end

  def update
  end

  def destroy
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
