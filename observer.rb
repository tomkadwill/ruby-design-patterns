class Employee
  attr_reader :pay

  def initialize(name, pay)
    @name = name
    @pay = pay
    @observers = []
  end

  def pay=(new_pay)
    @pay = new_pay
    notify_observers
  end

  def add_observer(observer)
    @observers << observer
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end

class Tax
  def update(employee)
    puts "You will have a new tax band for #{employee.pay}"
  end
end

class HR
  def update(employee)
    puts "Congratulations on your new salary of #{employee.pay}!"
  end
end

tom = Employee.new('tom', 20_000)
tom.add_observer(Tax.new)
tom.add_observer(HR.new)

tom.pay = 30_000
