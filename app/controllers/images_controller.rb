class ImagesController < ApplicationController

  def new
  end

  def create
    #render plain: params[:image].inspect
    @image = Image.new image_params
    @image.save
  end

  private

  def image_params
    params.require(:image).permit(:description) #user can send a description
  end
end
