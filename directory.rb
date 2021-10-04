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
  students = []
  while true do
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.chomp
    break if name.empty?
    puts "Please enter the students cohort"
    cohort = gets.chomp
    puts "This is your input: #{name} #{cohort}"
    puts "If it is correct, please confirm with 'y'."
    puts "If it is incorrect and you want to re-do it, please enter 'n'."
    user_input = ""
    until user_input == "n" || user_input =="y"
      user_input = gets.chomp
    end
    next if user_input == "n"
    cohort = "november" if cohort.empty?
    students << {name: name.to_sym, cohort: cohort.to_sym, hobby: :coding, 
		height: :medium, country: :somewhere}
    correct_students = students.count == 1 ? "student" : "students"
    puts "Now we have #{students.count} #{correct_students}" 
  end
  students.sort! do |student_1,student_2| 
    student_1[:cohort] <=> student_2[:cohort]
  end
end

def print_header
  puts "The students of the Villains Academy".center(60)
  puts "-----------------".center(60)
end

def print(students, letter)
  i = 0
  until i == students.length
    if students[i][:name][0] == letter && students[i][:name].length < 12
      puts "#{i + 1} #{students[i][:name]} " \
      "(#{students[i][:cohort]} cohort" \
      " #{students[i][:hobby]}" \
      " #{students[i][:height]}" \
      " #{students[i][:country]})".center(60)
    end
    i += 1
  end
end

def print_footer(names)
  correct_names = names.count == 1 ? "student" : "students"
  puts "Overall, we have #{names.count} great #{correct_names}".center(60)  
end

# now we have to call the methods
letter = beginning_letter.upcase
students = input_students
print_header
print(students, letter)
print_footer(students)
