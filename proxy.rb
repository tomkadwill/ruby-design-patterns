class Shift
  def name
    'big shift'
  end

  def time
    '10:00:00'
  end

  def ward
    'paternaty'
  end
end

class ShiftProxy
  def initialize(shift_obj = nil)
    @shift_obj = shift_obj
  end

  private

  def access_granted?
    true
    # do some logic to check acess
  end

  def subject
    # This delays creation of the Shift object until it is required
    @shift_obj ||= Shift.new
  end

  def method_missing(message)
    subject.send(message)
  end
end

shift = Shift.new
shift_proxy = ShiftProxy.new#(shift)

puts shift_proxy.name
puts shift_proxy.time
puts shift_proxy.ward
