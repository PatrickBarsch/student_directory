students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Kruger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november},
]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  #get the first name
  name = gets.chomp
  until name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get the next name from the user
    name = gets.chomp
  end
  return students
end

def print_header
  puts "The students of the Villains Academy"
  puts "-----------------"
end

def print(students)
  students.each_with_index do |student, number|
    puts "#{number + 1} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

# now we have to call the methods
students = input_students
print_header
print(students)
print_footer(students)
