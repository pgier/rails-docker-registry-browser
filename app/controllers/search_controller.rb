class SearchController < ApplicationController
  def index
    @registry_hostname = ENV["REGISTRY_HOST_PORT"]
    if params["id"] == "tag_list"
      @docker_image_path = params["image_path"]
      redirect_to("/images/#{@docker_image_path}")
    else
      search_images params["search_term"]
    end
  end

  def search_images(search_term)
    @search_term = params["search_term"]
    if @search_term
      @results = DockerImage.search(@search_term)
      if @results and @results.respond_to?("keys")
        @num_results = @results["num_results"]
        @image_results = @results["results"]
      end
    else
      @results = nil
    end
  end

end
