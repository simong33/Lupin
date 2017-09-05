class CompetitorsController < ApplicationController
  def new
  end

  def create
    @user = current_user
    client = @user.client
    competitor = Competitor.new(competitor_params)
    competitor_infos = client.user(competitor.nickname)
    competitor.name = competitor_infos.name
    competitor.uid = competitor_infos.id
    competitor.user_id = @user.id
    competitor.active = true
    competitor.image = client.user(competitor.uid.to_i).profile_image_url.to_s
    competitor.save
  end

  def my_competitors
    @user = current_user
    @competitor = Competitor.new
    @competitors = @user.competitors
  end

  private

  def competitor_params
    params.require(:competitor).permit(:nickname)
  end
end
