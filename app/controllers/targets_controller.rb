class TargetsController < ApplicationController
  def create
    @user = current_user
    client = @user.client
    competitor = @user.competitors.sample
    target = Target.new
    target.uid = client.follower_ids(competitor.nickname).attrs[:ids].sample
    target.name = client.user(target.uid.to_i).name
    client.follow(target.uid.to_i)
    target.competitor = competitor
    target.save
    follow = Follow.create(user_id: @user.id, target_id: target.id)
  end
end