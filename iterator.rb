class ATeam
  include Enumerable

  def initialize(*members)
    @members = members
  end

  def each(&block)
    @members.each(&block)
  end
end

ateam = ATeam.new("Face", "B.A. Barracus", "Murdoch", "Hannibal")

p ateam.map(&:downcase)
