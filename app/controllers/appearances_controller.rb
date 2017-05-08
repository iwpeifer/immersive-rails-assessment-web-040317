require 'pry'

class AppearancesController < ApplicationController

  def index
    @appearances = Appearance.all
  end

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.create(appearance_params(:guest_id, :episode_id, :rating))
    redirect_to guests_path
  end

  def show
    @appearance = Appearance.find(params[:id])
  end

  private

  def appearance_params(*args)
    params.require(:appearance).permit(*args)
  end

end
