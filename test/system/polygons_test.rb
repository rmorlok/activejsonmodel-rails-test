require "application_system_test_case"

class PolygonsTest < ApplicationSystemTestCase
  setup do
    @polygon = polygons(:one)
  end

  test "visiting the index" do
    visit polygons_url
    assert_selector "h1", text: "Polygons"
  end

  test "should create polygon" do
    visit polygons_url
    click_on "New polygon"

    fill_in "Name", with: @polygon.name
    click_on "Create Polygon"

    assert_text "Polygon was successfully created"
    click_on "Back"
  end

  test "should update Polygon" do
    visit polygon_url(@polygon)
    click_on "Edit this polygon", match: :first

    fill_in "Name", with: @polygon.name
    click_on "Update Polygon"

    assert_text "Polygon was successfully updated"
    click_on "Back"
  end

  test "should destroy Polygon" do
    visit polygon_url(@polygon)
    click_on "Destroy this polygon", match: :first

    assert_text "Polygon was successfully destroyed"
  end
end
