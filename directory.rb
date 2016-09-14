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

# print students
def print_students(students)
  students.each do |student|
    puts "#{student[:name]}".center(20) +
    "(#{student[:cohort]} cohort)".center(20) +
    "- Hobbies: #{student[:hobbies]}".center(20) +
    "- Country: #{student[:country_of_birth]}".center(20)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great student#{names.count == 1 ? '' : 's'}"
end

def interactive_menu
  students = []
  loop do
    #1. print the menu and ask the user what to do
    puts "What do you wan to do? Select one of the following options:"
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        # input students
        students = input_students
      when "2"
        # show the students
        print_header
        print_students(students)
        print_footer(students)
      when "9"
        puts "----------".center(22)
        puts
        exit # this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
