require 'test_helper'

class DockerImageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get docker_image_show_url
    assert_response :success
  end

end
