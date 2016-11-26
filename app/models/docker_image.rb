
class DockerImage
  include HTTParty
  registry_hostport = ENV["REGISTRY_HOST_PORT"]
  base_uri "http://#{registry_hostport}/v1"
  format :json

  def self.search(keyword, page=1, num=25)
    begin
      response = get("/search", query: {q: keyword, page: page, n: num})
      if (response and response.respond_to?("keys"))
        @search_results = response
      else
        @search_results = nil
      end
    rescue HTTParty::Error, JSON::ParserError
      @search_results = nil
    end
  end

  def self.tags(image_path)
    begin
      response = get("/repositories/#{image_path}/tags")
      if (response and response.respond_to?("keys"))
        @image_tags = response
      else
        @image_tags = nil
      end
    rescue HTTParty::Error, JSON::ParserError
      @image_tags = nil
    end
  end

  def self.image_info(image_id)
    begin
      response = get("/images/#{image_id}/json", :verify => false )
      if (response and response.respond_to?("keys"))
        @image_info = response
      else
        @image_info = nil
      end
    rescue HTTParty::Error, JSON::ParserError
      @image_info = nil
    end
  end
end