students = [
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
# Print a list of all the students
puts "The students of the Villains Academy"
puts "-----------------"
students.each do |student|
  puts student 
end
# Finally, we print the overall number using print to avoid the linebreak.
puts "Overall, we have #{students.count} great students."
