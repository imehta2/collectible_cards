class HomeController < ApplicationController
  def index
    character_details_response = JSON.parse(URI.open('https://rickandmortyapi.com/api/character').read)
    location_details_response = JSON.parse(URI.open('https://rickandmortyapi.com/api/location').read)

    @character_details = character_details_response['results'].map do |character|
      character_location = location_details_response['results'].find do |location|
        location['residents'].any? { |resident| resident.split('/').last.to_i == character['id'] }
      end

      character.merge('location' => character_location)
    end
  end
  def about_us
    # You can define this action if you want to add specific content to the About Us page
  end

  def contact_us
    # You can define this action if you want to add specific content to the Contact Us page
  end

  def search
    query = params[:query].to_s.downcase.strip

    # Add logic here to perform the search based on the 'query' parameter
    # For example, you can filter the @character_details array based on the query.
    @search_results = @character_details.select { |character| character['name'].downcase.include?(query) }
  end
end
