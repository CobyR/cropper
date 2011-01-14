class MainController < ApplicationController
  def index
    redirect_to crop_picture_path(18)
  end
end
