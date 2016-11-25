require 'test_helper'

class DockerRegV1ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get docker_reg_v1_index_url
    assert_response :success
  end

end
