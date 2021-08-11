require "test_helper"

class ClientFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_file = client_files(:one)
  end

  test "should get index" do
    get client_files_url, as: :json
    assert_response :success
  end

  test "should create client_file" do
    assert_difference('ClientFile.count') do
      post client_files_url, params: { client_file: { id_client: @client_file.id_client, name: @client_file.name } }, as: :json
    end

    assert_response 201
  end

  test "should show client_file" do
    get client_file_url(@client_file), as: :json
    assert_response :success
  end

  test "should update client_file" do
    patch client_file_url(@client_file), params: { client_file: { id_client: @client_file.id_client, name: @client_file.name } }, as: :json
    assert_response 200
  end

  test "should destroy client_file" do
    assert_difference('ClientFile.count', -1) do
      delete client_file_url(@client_file), as: :json
    end

    assert_response 204
  end
end
