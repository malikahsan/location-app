class ProfilesController < ApplicationController
  before_action :single_data

  def show
    @address = @user&.address
    @coordinate = @address&.coordinate.blank? ? [0, 0] : @address&.coordinate.to_a
    @zoom = @coordinate == [0, 0] ? 0 : 10 
  end

  def update
    coordinate = location_params[:coordinate].split(",").map{|x| x.to_f}
    _params = {
      address: location_params[:address], 
      coordinate: coordinate, 
      share_type: location_params[:share_type],
      user_ids: location_params[:user_ids].reject(&:blank?)
    }
    @address = @user&.address
    @address = @address.present? ? @address.update(_params) : Address.create(_params.merge(user_id: @user.id))
    @save =  false
    if @address
      @save = true
      @message = "Location successfully added"
     else
       @message = @address.errors.full_messages.join(", ")
    end

    # redirect_to profile_path(id: current_user&.username.to_s)
  end

  def single_data
    @user = User.find_by(username: current_user&.username.to_s)
  end

  private
  def location_params
    params.permit(:address, :coordinate, :share_type, user_ids: [])
  end
end
