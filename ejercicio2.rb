require 'Date'

class Course
  def initialize(name, begin_date, end_date)
    @name = name
    begin
      @begin_date = Date.parse(begin_date)
      @end_date = Date.parse(end_date)
    rescue ArgumentError => e
      print "Opps! we have an error #{e}"
    end
  end

  def begin_before_at?(date)
    if date >= Date.parse('01/01/2019')
      raise 'The date entered is incorrect'
    else
      @begin_date < date
    end
  end

  def end_after_at?(date)
    raise 'The date entered is incorrect' if date >= Date.parse('01/01/2019')
    @end_date > date
  end

  def to_s
    "#{@name}: #{@begin_date},#{@end_date}"
  end
end

def generate_course
  objects = []
  file = File.read('cursos.txt')
  file.split("\n").each do |line|
    fields = line.split(', ')
    objects << Course.new(fields[0], fields[1], fields[2])
  end
  objects
end

generated_courses = generate_course
now_date = Date.today
future_date = Date.today + (2 * 365)

print "#{generated_courses}\n"
print "Testing now date\n"
print "#{generated_courses.first.begin_before_at?(now_date)}\n"
print "Testing future date\n"
begin
  print generated_courses.first.begin_before_at? future_date
rescue StandardError => error
  print "#{error}\n"
end

print "Testing end date\n"
print "#{generated_courses.first.end_after_at?(now_date)}\n"
