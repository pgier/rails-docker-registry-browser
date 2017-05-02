class SearchController < ApplicationController
  def index
    @registry_hostname = ENV["REGISTRY_HOST_PORT"]
    if params["id"] == "list_tags"
      list_tags params["image_path"]
    else
      search_images params["search_term"]
    end
  end

  def list_tags(docker_image_path)
    if docker_image_path.nil? || !/\w+\/\w+/.match(docker_image_path)
      @image_list_error_message = "Invalid image path "\
          "\'#{docker_image_path}\', please enter path in"\
          " the form: namespace/image_name"
    else
      redirect_to("/images/#{docker_image_path}")
    end
  end

  def search_images(search_term)
    @search_term = params["search_term"]
    if @search_term
      @results = DockerImageV1.search(@search_term)
      if @results and @results.respond_to?("keys")
        @num_results = @results["num_results"]
        @image_results = @results["results"]
      end
    else
      @results = nil
    end
  end

end
