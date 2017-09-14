class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def index
  end

  def show

    @user = current_user
  end

  def new
    @user = current_user
    @profile = Profile.new
    render partial: 'form'
  end

  def edit
    @profile = current_user.profile
  end

  def update
    if @profile.update(profile_params)
      redirect_to user_profile_index
    else
      render partial: 'form'
    end
  end

  def create
    @profile = current_user.create_profile(profile_params)
    if @profile.save
      redirect_to user_profile_path(current_user, @profile)
    else
      render partial: 'form'
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:gamertag)
  end
end
