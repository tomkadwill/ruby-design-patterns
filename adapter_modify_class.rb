class Point
  attr_reader :latlong, :name

  def initialize(latlong, name)
    @latlong = latlong
    @name = name
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

# Modify class on the fly

class Point
  def lat
    latlong.split(', ')[0]
  end

  def long
    latlong.split(', ')[1]
  end
end

point = Point.new('51.501364, -0.141890', 'Buckingham Palace')
print Map.new(point).draw
