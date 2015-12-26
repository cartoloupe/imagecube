class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    STDOUT.puts "IN THE IMAGES CONTROLLER"
    require 'pry'; binding.pry
    @image = Image.new(image_params)

    if @image.save
      redirect_to images_path, notice: "Image uploaded."
    else
      render 'new'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_path, notice: "Image deleted."
  end

  private
  def image_params
    params.require(:image).permit(:file)
  end
end
