#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
while (answer = character_or_film)
  if answer == "1"
    character = get_character_from_user
    run_character_methods(character, "http://www.swapi.co/api/people/")
  elsif answer == "2"
    film = get_film_from_user
    run_film_methods(film, "http://www.swapi.co/api/films/")
  elsif answer == "9"
    puts "Goodbye"
    break
  else
    puts "That is not a valid response."
  end
end
