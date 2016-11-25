class DockerRegV1Controller < ApplicationController
  def index
    @registry_hostname = ENV["REGISTRY_HOST_PORT"]
    @docker_image_path = params["docker_image_path"]
    if @docker_image_path
      response =
          HTTParty.get("http://#{@registry_hostname}/v1/repositories/#{@docker_image_path}/tags")
      if response and response.respond_to?("keys")
        @docker_image_tags = response.keys
      end
    else
      @docker_image_tags = nil
    end
  end
end
