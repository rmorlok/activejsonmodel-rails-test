require "test_helper"

class PolygonTest < ActiveSupport::TestCase
  Minitest.after_run do
    Polygon.delete_all
  end

  test "create empty polygon" do
    p = Polygon.new(name: 'triangle', points: [])

    assert p.save
    assert 0, p.reload.points.length
    assert_equal 1, Polygon.all.count
  end

  test "create polygon" do
    p = Polygon.new(name: 'triangle', points: [
      Point.new(x: 0, y: 0),
      Point.new(x: 0, y: 10),
      Point.new(x: 10, y: 0),
    ])

    assert 3, p.points.length
    assert p.save
    assert_equal 1, Polygon.all.count
  end
end
