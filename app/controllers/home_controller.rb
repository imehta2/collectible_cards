# app/controllers/home_controller.rb
require 'rest-client'

class HomeController < ApplicationController
  def index
    response = RestClient.get ''
    @collectible_cards = JSON.parse(response)
  end
end
