class UsersController < ApplicationController
  def show
    @user = current_user
    @competitor = Competitor.new
    @competitors = @user.competitors
    @target = Target.new
    @targets = @user.targets
  end
end
