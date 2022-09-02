require "test_helper"

class PolygonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @polygon = polygons(:one)
  end

  test "should get index" do
    get polygons_url
    assert_response :success
  end

  test "should get new" do
    get new_polygon_url
    assert_response :success
  end

  test "should create polygon" do
    assert_difference("Polygon.count") do
      post polygons_url, params: { polygon: { name: @polygon.name } }
    end

    assert_redirected_to polygon_url(Polygon.last)
  end

  test "should show polygon" do
    get polygon_url(@polygon)
    assert_response :success
  end

  test "should get edit" do
    get edit_polygon_url(@polygon)
    assert_response :success
  end

  test "should update polygon" do
    patch polygon_url(@polygon), params: { polygon: { name: @polygon.name } }
    assert_redirected_to polygon_url(@polygon)
  end

  test "should destroy polygon" do
    assert_difference("Polygon.count", -1) do
      delete polygon_url(@polygon)
    end

    assert_redirected_to polygons_url
  end
end
