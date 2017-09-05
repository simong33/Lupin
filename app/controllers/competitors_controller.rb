class CompetitorsController < ApplicationController
  def new
  end

  def create
    @user = current_user
    client = @user.client
    competitor = Competitor.new(competitor_params)
    competitor_infos = client.user(competitor.nickname)
    competitor.name = competitor_infos.name
    competitor.user_id = @user.id
    competitor.active = true
    competitor.save
  end

  private

  def competitor_params
    params.require(:competitor).permit(:nickname)
  end
end
