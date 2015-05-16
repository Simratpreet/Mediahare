class NewsFeedsController < ApplicationController
	def index
		friend_ids = current_user.friendships.approved.pluck("friend_id")
		inverse_friend_ids = current_user.inverse_friendships.approved.pluck("user_id")
		@activities = PublicActivity::Activity.order(created_at: :desc).where(owner_id: friend_ids + inverse_friend_ids, owner_type: "User")
	end
end
