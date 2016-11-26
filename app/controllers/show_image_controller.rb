class ShowImageController < ApplicationController
  def index
    image_namespace = params[:namespace]
    image_name = params[:image_name]
    @image_path = "#{image_namespace}/#{image_name}"
    @image_tags = DockerImage.tags(@image_path)
  end
  def show
    @image_id = params[:id]
    @image_info = DockerImage.image_info(@image_id)
  end
end
