class TargetsController < ApplicationController
  def create
    @user = current_user
    client = @user.client
    @competitors = @user.competitors.where(active: true)
    targets = find_target
    targets.each do |target_id|
      target = Target.new
      target_infos = client.user(target_id)
      target.name = target_infos.name
      target.competitor = @competitors.last #EDIT IN THE DB!!!
      target.description = target_infos.description
      target.email = target_infos.email
      target.location = target_infos.location
      target.nickname = target_infos.screen_name
      target.image = target_infos.profile_image_url.to_s
      target.save
      sleep 1
    end
  end

  private

  def find_target
    client = current_user.client
    targets_uid = []
    num_competitors = @competitors.size
    @competitors.each do |competitor|
      targets_uid << client.friend_ids(competitor.nickname).attrs[:ids]
    end
    targets_uid.flatten!
    result = targets_uid.find_all {|e| targets_uid.count(e) > (num_competitors - 1)}
    result.uniq
  end
end
