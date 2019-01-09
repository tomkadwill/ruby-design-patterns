class Point
  attr_reader :latlong, :name

  def initialize(latlong, name)
    @latlong = latlong
    @name = name
  end
end

class MapPointAdapter
  attr_reader :lat, :long, :name

  def initialize(point)
    @point = point
  end

  def lat
    @point.latlong.split(', ')[0]
  end

  def long
    @point.latlong.split(', ')[1]
  end

  def name
    @point.name
  end
end

class Map
  def initialize(point)
    @point = point
  end

  def draw
    print "#{@point.lat}, #{@point.long} -> #{@point.name}"
  end
end

point = Point.new('51.501364, -0.141890', 'Buckingham Palace')
map_point_adapter = MapPointAdapter.new(point)
print Map.new(map_point_adapter).draw
