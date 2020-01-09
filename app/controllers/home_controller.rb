class HomeController < ApplicationController
  def index
    @avatar = current_user.avatar
  end
end
