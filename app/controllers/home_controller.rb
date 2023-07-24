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
end
