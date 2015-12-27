class CubeController < ApplicationController
  def index
    @cube = Cube.find_by(id: 1) ||
      Cube.create(
        id: 1,
        cubex: 0.001,
        cubey: 0.001,
        cubez: 0.001,
      )

    respond_to do |format|
      format.json {render json: @cube}
    end
  end

  def show
  end

  def update
    @cube = Cube.find_by(id: 1) || Cube.create(id: 1)

    if @cube.update(cube_params)
      redirect_to cube_show_path
    else
      render images_path
    end

  end

  private
  def cube_params
    params.require(:cube).permit(:cubex, :cubey, :cubez)
  end
end
