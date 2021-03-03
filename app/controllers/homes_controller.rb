class HomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @users = if user_signed_in?
      publiced = User.joins(:address).where("addresses.share_type IN (?)", ["public"])
      selected = User.joins(:address).where("addresses.share_type IN (?) AND ? = ANY (user_ids)", ["selected"], current_user.id.to_s)
      @users = publiced + selected
    else
      User.joins(:address).where("addresses.share_type IN (?)", ["public"])
    end
  end

  def map
    @user = User.find_by_username(params[:username])
    @user = if user_signed_in?
      User.joins(:address).where("addresses.share_type IN (?) AND ? = ANY (user_ids) OR user_id = ?", ["public", "selected"], current_user.id.to_s, @user.id).last
    else
      User.joins(:address).where("addresses.share_type IN (?)", ["public"]).find_by_username(@user.username)
    end
    @address = @user&.address
    @coordinate = @address&.coordinate.blank? ? [0, 0] : @address&.coordinate.to_a
  end
end
