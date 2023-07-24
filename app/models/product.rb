# app/models/product.rb

class Product < ApplicationRecord
  # Your existing attributes and validations

  # Add these attributes if you haven't already
  enum gender: { male: 'Male', female: 'Female' }
  enum status: { alive: 'Alive', dead: 'Dead' }
end
