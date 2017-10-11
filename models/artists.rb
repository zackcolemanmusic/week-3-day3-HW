require('pg')
require_relative('../sql_runner.rb')

class Artists

  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options('name')

  end

  def save()

      sql = "INSERT INTO Artists(name) VALUES ($1) RETURNING *"

      values = [@name]

      @id = SqlRunner.run(sql, values)[0]['id'].to_i()
  end
end
