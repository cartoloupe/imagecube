class ImagesController < ApplicationController
  def index
    @images = [
      @image1 = Image.find_by(id: 1),
      @image2 = Image.find_by(id: 2),
      @image3 = Image.find_by(id: 3),
      @image4 = Image.find_by(id: 4),
      @image5 = Image.find_by(id: 5),
      @image6 = Image.find_by(id: 6),
    ]

    respond_to do |format|
      format.json { render json: @images.map(&:file_url)}
      format.html {}
    end
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to images_path, notice: "Image uploaded."
    else
      render 'new'
    end
  end

  def update
    @image = Image.find_by(id: params[:id]) || Image.create(id: params[:id])

    if @image.update(image_params)
      redirect_to images_path, notice: "Image updated."
    else
      render 'index'
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
