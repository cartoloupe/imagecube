class CubeController < ApplicationController
  def show
  end

  def load
    @image = Image.create(image_params)
  end

  private
  def image_params
    params.require(:image).permit(:file)
  end
end
