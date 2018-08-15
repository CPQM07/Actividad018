class Table
  def initialize(name, day_1, day_2, day_3, day_4)
    @name = name
    @day_1 = day_1.to_i
    @day_2 = day_2.to_i
    @day_3 = day_3.to_i
    @day_4 = day_4.to_i
  end

  def max_by_table
    days = [@day_1, @day_2, @day_3, @day_4]
    day_max = days.max
    day_max_value = days.index(day_max) + 1
    print "Table's name: #{@name}, had the highest income: #{day_max_value}, with a value of: #{day_max}\n"
  end

  def average
    [@day_1,@day_2,@day_3,@day_4].sum / 4.0
  end

  def to_s
    "#{@name}: #{@day_1},#{@day_2},#{@day_3},#{@day_4}"
  end
end

def generate_table
  o = []
  f = File.read('casino.txt')
  f.split("\n").each do |linea|
    campos = linea.split(', ')
    o << Table.new(campos[0], campos[1], campos[2], campos[3], campos[4])
  end
  o
end
generated_table = generate_table

print "Mayor recaudación por mesas\n"
generated_table.each { |mesa| print mesa.max_by_table }

ta = generated_table.inject(0) { |suma, mesa| suma + mesa.average }
print "Promedio de todas las mesas: #{ta / generated_table.length}\n"
