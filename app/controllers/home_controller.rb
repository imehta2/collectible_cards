# app/controllers/home_controller.rb

class HomeController < ApplicationController
  def index
    @character_details = Product.all # Assuming 'Product' is the model representing the characters' details

    # Optionally, you can sort the characters' details by name or any other attribute
    @character_details = @character_details.order(name: :asc)
  end

  def about_us
    # You can define this action if you want to add specific content to the About Us page
  end

  def contact_us
    # You can define this action if you want to add specific content to the Contact Us page
  end

  def search
    query = params[:query].to_s.downcase.strip

    # Retrieve all character details from the database and filter them based on the search query
    @search_results = if query.present?
                        Product.where('lower(name) LIKE ? OR lower(status) LIKE ? OR lower(species) LIKE ? OR lower(gender) LIKE ?',
                                      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
                      else
                        []
                      end
  end
end
