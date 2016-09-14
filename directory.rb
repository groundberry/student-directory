@students = [] # an empty array accessible to al methods

def store_student(name, cohort)
  @students << {
    name: name,
    cohort: cohort.gsub(/\s+/,"").capitalize.to_sym
  }
end

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  while true
    puts "Enter the student's full name or press enter to exit:"
    name = STDIN.gets.chomp
    break if name.empty?
    puts "Please enter the student's cohort (e.g. Sep2016):"
    cohort = STDIN.gets.chomp
    if cohort.empty?
      puts "Don't forget to enter the student's cohort or leave it blank for the default value (Sep2016):"
      cohort = STDIN.gets.chomp
      cohort = "Sep2016" if cohort.empty?
    end
    # add the student hash to the array
    store_student(name, cohort)
    puts "Now we have #{@students.count} great student#{@students.count == 1 ? '' : 's'}"
  end
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "--------------------------------".center(80)
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]}".center(20) +
    "(#{student[:cohort]} cohort)".center(20)
    puts
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great student#{@students.count == 1 ? '' : 's'}".center(80)
  puts
end

def print_menu
  puts "What do you wan to do? Select one of the following options:"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def ask_filename
  puts "Please enter the filename:"
  gets.chomp
end

def save_students
  # open the file for writing
  File.open(ask_filename, "w") do |file|
    # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(", ")
      file.puts(csv_line)
    end
  end
end

def load_students
  File.open(ask_filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(", ")
      store_student(name, cohort)
    end
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def process(selection)
  case selection
    when "1"
      input_students
      puts "* Student information successfuly entered *"
      puts
    when "2"
      show_students
      puts "* Student information successfully displayed *"
      puts
    when "3"
      save_students
      puts "* Input successfully saved *"
      puts
    when "4"
      load_students
      puts "* Input successfully loaded *"
      puts
    when "9"
      puts "----------".center(22)
      puts
      puts "* Program successfully closed *"
      puts
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
