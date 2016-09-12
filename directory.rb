def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # creates an empty array
  students = []
  # while the name is not empty, repeat this code
  while true
    # get the name
    puts "Please enter the student's full name:"
    name = gets.chomp
    break if name.empty?
    puts "Please enter the student's cohort:"
    cohort = gets.chomp
    puts "Please enter the student's hobbies:"
    hobbies = gets.chomp
    puts "Please enter the student's country of birth:"
    country_of_birth = gets.chomp
    # add the student hash to the array
    students << {
      name: name,
      cohort: cohort,
      hobbies: hobbies,
      country_of_birth: country_of_birth
    }
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
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) - Hobbies: #{student[:hobbies]} - Country: #{student[:country_of_birth]}"
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
