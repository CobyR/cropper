class MainController < ApplicationController
  def index
    @picture = Picture.new
  end
end
