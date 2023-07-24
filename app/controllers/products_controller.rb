class ProductsController < ApplicationController
  def index
    @products = Product.all

    # Filter products based on the selected category
    if params[:category].present? && params[:category] != 'all'
      # Use where to filter based on gender and status
      category_param = params[:category].downcase
      @products = @products.where('lower(gender) LIKE ? OR lower(status) LIKE ?', "%#{category_param}%", "%#{category_param}%")
    end

    # Perform the search if a query is present
    if params[:query].present?
      query_param = params[:query].downcase
      @products = @products.where('lower(name) LIKE ? OR lower(status) LIKE ? OR lower(gender) LIKE ?', "%#{query_param}%", "%#{query_param}%", "%#{query_param}%")
    end

    if @products.empty?
      flash.now[:alert] = 'No results found.'
    end
  end
end
