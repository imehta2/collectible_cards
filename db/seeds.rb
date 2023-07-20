# app/db/seeds.rb

require 'open-uri'

# Define a method to fetch data from the API
def fetch_api_data(url)
  response = URI.open(url)
  JSON.parse(response.read)
end

# Fetch data from the API
character_details_response = fetch_api_data('https://rickandmortyapi.com/api/character')
location_details_response = fetch_api_data('https://rickandmortyapi.com/api/location')

# Seed the database
character_details_response['results'].each do |character|
  location = location_details_response['results'].find do |location|
    location['residents'].any? { |resident| resident.split('/').last.to_i == character['id'] }
  end

  Product.create!(
    name: character['name'],
    status: character['status'],
    species: character['species'],
    gender: character['gender'],
    location: location&.dig('name'),
    dimension: location&.dig('dimension'),
    image: character['image']
  )
end
