class ShowImageController < ApplicationController
  def index
    image_namespace = params[:namespace]
    image_name = params[:image_name]
    @image_path = "#{image_namespace}/#{image_name}"
    @image_tags = DockerImageV1.tags(@image_path)
  end
  def show
    @image_id = params[:id]
    @image_info = DockerImageV1.image_info(@image_id)
    @image_ancestry = DockerImageV1.ancestry(@image_id)
  end
end
