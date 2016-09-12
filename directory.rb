# let's put all the students into an array
students =[
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Kruger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(names)
  names.each do |student|
    puts student
  end
end

def print_footer(names)
  puts "Overall, #{names.count} we have great students"
end

# nothing happens until we call the methods
print_header
print_students(students)
print_footer(students)
