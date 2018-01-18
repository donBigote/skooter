require 'test_helper'

module Skooter
  class SubmissionsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get index" do
      get submissions_index_url
      assert_response :success
    end

  end
end
