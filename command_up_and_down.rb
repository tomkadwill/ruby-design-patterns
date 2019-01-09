class Migrations
  attr_accessor :migrations

  def initialize(migrations = [])
    @migrations = migrations
    @last_migration = -1
  end

  def <<(migration)
    migrations << migration
  end

  def up!
    @last_migration += 1
    migrations[@last_migration].execute_up!
  end

  def down!
    migrations[@last_migration].execute_down!
    @last_migration -= 1
  end
end

class Migration
  attr_accessor :up_command
  attr_accessor :down_command

  def initialize(up, down)
    @up_command = up
    @down_command = down
  end

  def execute_up!
    @up_command.call
  end

  def execute_down!
    @down_command.call
  end
end

first_migration = Migration.new(->{ puts 'CREATE USERS table' }, ->{ puts 'DROP USERS table' })
second_migration = Migration.new(->{ puts 'ADD NAME column to USERS table' }, ->{ puts 'REMOVE NAME column ON USERS table' })

migrations = Migrations.new
migrations << first_migration
migrations << second_migration

migrations.up!
migrations.up!
migrations.down!
