class UsersController < ApplicationController
  def show
    @user = current_user
    @competitor = Competitor.new
  end
end
