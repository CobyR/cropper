class MainController < ApplicationController
  def index
    redirect_to pictures_path
  end
end
