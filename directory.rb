@students = []
@current_letter = ""

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    @current_letter = beginning_letter
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again."
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students
  print_footer
end

def beginning_letter
  puts "Please enter the letter, the students names that"
  puts "are printed should begin with"
  beginning_letter = gets.gsub(/\n|\r|\n\r/, "")
end

def input_students
  @students = []
  while true do
    name, cohort = get_student
    break if name.empty?
    user_input = confirm_input(name,cohort)
    next if user_input == "n"
    cohort = "november" if cohort.empty?
    @students << {name: name.to_sym, 
      cohort: cohort.to_sym, 
      hobby: :coding, 
		  height: :medium, 
      country: :somewhere
    }
    puts "Now we have #{@students.count} student#{@students.count == 1 ? "" : "s"}" 
  end
  @students.sort! do |student_1,student_2| 
    student_1[:cohort] <=> student_2[:cohort]
  end
end

def get_student
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.gsub(/\n|\r|\n\r/, "")
  puts "Please enter the students cohort"
  cohort = gets.gsub(/\n|\r|\n\r/, "")
  return name, cohort
end

def confirm_input(name, cohort)
  puts "This is your input: #{name} #{cohort}"
  puts "If it is correct, please confirm with 'y'."
  puts "If it is incorrect and you want to re-do it, please enter 'n'."
  user_input = ""
  until user_input == "n" || user_input =="y"
    user_input = gets.gsub(/\n|\r|\n\r/, "")
  end
  user_input
end

def print_header
  puts "The students of the Villains Academy".center(60)
  puts "-----------------".center(60)
end

def print_students
  i = 0
  previous_cohort = @students[0][:cohort]
  until i == @students.length
    name_matches = @students[i][:name][0] == @current_letter
    not_to_long = @students[i][:name].length < 12
    if ( name_matches || @current_letter =="" ) && not_to_long
      puts "#{i + 1} #{@students[i][:name]} " \
      "(#{@students[i][:cohort]} cohort" \
      " #{@students[i][:hobby]}" \
      " #{@students[i][:height]}" \
      " #{@students[i][:country]})".center(60)
    end
    if previous_cohort != @students[i][:cohort]
      puts "-----------------".center(60)
    end
    previous_cohort = @students[i][:cohort]
    i += 1
  end
end

def print_footer
  correct_names = @students.count == 1 ? "student" : "students"
  puts "Overall, we have #{@students.count} great #{correct_names}".center(60)  
end

interactive_menu
