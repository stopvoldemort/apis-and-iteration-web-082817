require 'pry'

def welcome
  "Hello friend."
end

def character_or_film
  puts "Would you like to learn about a character or a film?\n"
  puts "Type 1 for character, 2 for film, or 9 to quit."
  gets.chomp.downcase
end

def get_character_from_user
  puts "please enter a Star Wars character:"
  gets.chomp.downcase
end

def get_film_from_user
  puts "please enter a Star Wars film:"
  gets.chomp.downcase
end
