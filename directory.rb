def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # creates an empty array
  students = []
  # while the name is not empty, repeat this code
  while true
    # get the name
    puts "Enter the student's full name or press enter to exit:"
    name = gets.chomp
    break if name.empty?
    puts "Please enter the student's cohort (e.g. Sep2016):"
    cohort = gets.chomp
    if cohort.empty?
      puts "Don't forget to enter the student's cohort or leave it blank for the default value (Sep2016):"
      cohort = gets.chomp
      cohort = "Sep2016" if cohort.empty?
    end
    puts "Please enter the student's hobbies:"
    hobbies = gets.chomp
    puts "Please enter the student's country of birth:"
    country_of_birth = gets.chomp
    # add the student hash to the array
    students << {
      name: name,
      cohort: cohort.gsub(/\s+/,"").capitalize.to_sym,
      hobbies: hobbies,
      country_of_birth: country_of_birth
    }
    puts "Now we have #{students.count} great student#{students.count == 1 ? '' : 's'}"
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "--------------------------------".center(80)
end

# print students grouped by cohorts
def print_sorted_cohorts(students)
  sorted_students = students.sort_by { |k| k[:cohort]}
  sorted_students.each do |student|
    puts "#{student[:name]}".center(20) +
    "(#{student[:cohort]} cohort)".center(20) +
    "- Hobbies: #{student[:hobbies]}".center(20) +
    "- Country: #{student[:country_of_birth]}".center(20)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great student#{names.count == 1 ? '' : 's'}"
end

# nothing happens until we call the methods
students = input_students
if !students.empty?
  print_header
  print_sorted_cohorts(students)
  print_footer(students)
else
  print_header
  puts "(There are no students registered yet)".center(80)
  puts
end
