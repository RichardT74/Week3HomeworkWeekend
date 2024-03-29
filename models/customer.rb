require_relative("../db/sql_runner")
require_relative("./film")

class Customer

	attr_reader :id
	attr_accessor :name, :funds

	def initialize(options)
		@id = options['id'].to_i if options['id']
		@name = options['name']
		@funds = options['funds'].to_i
end

def save()
	sql = "INSERT INTO customers
	(name, funds) VALUES ($1, $2)
	RETURNING id"
	values = [@name, @funds]
	customer = SqlRunner.run(sql, values).first
	@id = customer['id'].to_i
end


def update()
sql = "UPDATE customers SET(
name, funds) = ($1, $2)
WHERE id = $3"
values = [@name, @funds, @id]
SqlRunner.run(sql, values)
end


def self.delete_all()
	sql = "DELETE FROM customers"
	values = []
SqlRunner.run(sql, values)
end

def films()
	sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id =
	 tickets.film_id WHERE customer_id = $1"
	values = [@id]
	film_data = SqlRunner.run(sql, values)
	return film_data.map {|x|Film.new(x)}
end


end
