class Task
  attr_accessor :name, :parent

  def initialize(name)
    @name = name
    @parent = nil
  end

  def get_time_required
    0.0
  end
end

class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def <<(task)
    @sub_tasks << task
    task.parent = self
  end

  def [](index)
    @sub_tasks[index]
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def get_time_required
    time = 0.0
    @sub_tasks.each { |task| time += task.get_time_required }

    time
  end
end

class AddDryIngredientsTask < Task
  def initialize
    super('Add dry ingredients')
  end

  def get_time_required
    1.0
  end
end

class MixTask < Task
  def initialize
    super('Mix up the batter!')
  end

  def get_time_required
    3.0
  end
end

class MakeBatterTask < CompositeTask
  def initialize
    super('Make batter')
    @sub_tasks = []

    @sub_tasks << AddDryIngredientsTask.new
    @sub_tasks << MixTask.new
  end
end

make_batter = MakeBatterTask.new

make_batter << AddDryIngredientsTask.new
print make_batter.get_time_required
print make_batter[2].parent
