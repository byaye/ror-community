class ImagesController < ApplicationController
  # Standard CRUD actions: index, show, new, edit, create, update and destroy
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.where user_id: current_user.id
  end
  
  def new
    @image = Image.new
  end

  def create
    #render plain: params[:image].inspect
    @image = current_user.images.new image_params # Instance variable (prefixed with @) to hold a reference to the article object. We do this because Rails will pass all instance variables to the view.

    if @image.save
      return redirect_to images_path
    end

    render :new
  end

  def show
  end

  def edit
  end

  def update
    @image.update image_params
    redirect_to @image
  end

  def destroy
    @image.destroy
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit :description, :picture #user can send a description
  end

  def set_image
    @image = Image.find params[:id]
  end
end
