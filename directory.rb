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

def beginning_letter
  puts "Please enter the letter, the students names that"
  puts "are printed should begin with"
  beginning_letter = gets.chomp
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  #get the first name
  name = gets.chomp
  until name.empty? do
    students << {name: name, cohort: :november, hobby: :coding, height: :medium, country: :somewhere}
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

def print(students, letter)
  i = 0
  until i == students.length
    if students[i][:name][0] == letter && students[i][:name].length < 12
      puts "#{i + 1} #{students[i][:name]} (#{students[i][:cohort]} cohort " \
       "#{students[i][:hobby]} #{students[i][:height]} #{students[i][:country]})"
    end
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

# now we have to call the methods
letter = beginning_letter.upcase
students = input_students
print_header
print(students, letter)
print_footer(students)
