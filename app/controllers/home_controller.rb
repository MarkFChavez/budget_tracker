class HomeController < ApplicationController
  def index
    @notebooks = notebooks
  end

  private

  def notebooks
    current_user.notebooks
  end
end
