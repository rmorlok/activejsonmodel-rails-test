require "test_helper"

class PolygonTest < ActiveSupport::TestCase
  test "create empty polygon" do
    p = Polygon.new(name: 'triangle', points: [])

    assert p.save
    assert 0, p.reload.points.length
  end

  test "create polygon" do
    p = Polygon.new(name: 'triangle', points: [
      Point.new(x: 0, y: 0),
      Point.new(x: 0, y: 10),
      Point.new(x: 10, y: 0),
    ])
    
    assert 3, p.points.length
    assert p.save

    pu = Polygon.find_by(id: p.id)
    assert 3, pu.points.length

    assert 0, pu.points[0].x
    assert 0, pu.points[0].y

    assert 0, pu.points[1].x
    assert 10, pu.points[1].y

    assert 10, pu.points[2].x
    assert 0, pu.points[2].y
  end
end
