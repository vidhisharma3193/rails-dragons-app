class HomepagesController < ApplicationController
  def index
    @users = User.all
    @dragons = Dragon.all
    @set_on_homepage = true
  end
end