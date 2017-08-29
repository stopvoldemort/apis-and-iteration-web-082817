require 'rest-client'
require 'json'
require 'pry'

def get_info_from_api(api_url)
  all_characters = RestClient.get(api_url)
  JSON.parse(all_characters)
end


def get_character_data(character, api_url)
  while api_url
    characters_hash = get_info_from_api(api_url)
    characters_hash["results"].each do |character_hash|
      return character_hash if character_hash["name"].downcase == character
    end
    api_url = characters_hash["next"]
  end
  puts "That is not a character."
end


def get_film_urls(character_data)
  character_data["films"]
end


def film_url_request(film_urls)
  film_urls.map do |film_url|
    film_raw_data = RestClient.get(film_url)
    JSON.parse(film_raw_data)
  end
end


def film_titles(films_data)
  films_data.map { |film| film["title"] }
end


def list_character_films(title_array, character)
  puts "#{character} starred in: "
  title_array.each_with_index {|title, index| puts "#{index + 1}. #{title}"}
end


def run_character_methods(character, api_url)
  character_data = get_character_data(character, api_url)
  if character_data
    film_urls = get_film_urls(character_data)
    films_data = film_url_request(film_urls)
    title_array = film_titles(films_data)
    list_character_films(title_array, character)
  end
end


def get_film_data(film, api_url)
  films_data = get_info_from_api(api_url)
  films_data["results"].each do |film_data|
    return film_data if film_data["title"].downcase == film
  end
  puts "That is not the name of a film"
end


def print_film_description(film_data)
  puts film_data["opening_crawl"]
end


def run_film_methods(film, api_url)
  film_data = get_film_data(film, api_url)
  print_film_description(film_data) if film_data
end
