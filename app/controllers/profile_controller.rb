class ProfileController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def index

  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def edit
    @profile = current_user.profile
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render partial: 'form'
    end
  end

  def create
    @profile = current_user.create_profile(profile_params)
    if @profile.save
      redirect_to posts_path
    else
      render partial: 'form'
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:description, :gamertag)
  end
end
