class PicturesController < ApplicationController
  def index
    @pictures = Picture.find(:all, :order => 'image_updated_at desc')
  end

  def new
    @picture = Picture.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.new(params[:picture])
    if @picture.save
      redirect_to crop_picture_path(@picture)
    end
  end

  def crop
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(params[:picture])
      flash[:success] = 'The picture was Successfully updated.'
      render :action => "crop"
    end
  end

  def destroy
    @picture = Picture.find(params[:id])

    if @picture.delete
      flash[:success]='The picture was successfully deleted.'
    end

    redirect_to pictures_path
  end
end
