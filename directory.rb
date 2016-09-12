def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # creates an empty array
  students = []
  # while the name is not empty, repeat this code
  while true
    # get the name
    name = gets.chomp
    break if name.empty?
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(students)
  i = 0
  until i == students.count
    student = students[i]
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    i += 1
  end
end

def print_footer(names)
  puts "Overall, #{names.count} we have great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print_students(students)
print_footer(students)
