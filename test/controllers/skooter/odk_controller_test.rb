require 'test_helper'

module Skooter
  class OdkControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get index" do
      get odk_index_url
      assert_response :success
    end

    test "should get show" do
      get odk_show_url
      assert_response :success
    end

    test "should get submissions" do
      get odk_submissions_url
      assert_response :success
    end

  end
end
