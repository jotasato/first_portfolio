require 'test_helper'

class Admins::MenusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_menus_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_menus_show_url
    assert_response :success
  end

  test "should get new" do
    get admins_menus_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_menus_create_url
    assert_response :success
  end

  test "should get update" do
    get admins_menus_update_url
    assert_response :success
  end

end
