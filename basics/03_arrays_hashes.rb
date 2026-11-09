languages = ["Java", "Ruby", "Python"]

developer = {
  name: "Jihun",
  age: 25,
  main_language: "Java"
}

languages.push("JavaScript")
developer[:age] = 26
developer[:city] = "Seoul"

puts "Languages: #{languages.length}"
puts "Name: #{developer[:name]}"
puts "Age: #{developer[:age]}"
puts "Main Language: #{developer[:main_language]}"
puts "City: #{developer[:city]}"
