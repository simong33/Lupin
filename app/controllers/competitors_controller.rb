class CompetitorsController < ApplicationController
  def new
  end

  def create
    @user = current_user
    credentials = @user.credentials
    client = Twitter::REST::Client.new(credentials)
    competitor = Competitor.new(competitor_params)
    competitor_infos = client.user(competitor.nickname)
    competitor.name = competitor_infos.name
    competitor.user_id = @user.id
    competitor.save
  end

  private

  def competitor_params
    params.require(:competitor).permit(:nickname)
  end
end
