class OrganisationsController < ApplicationController

  def index
    @organisation = Organisation.all
  end

  def create
    @organisation = Organisation.new(user_params)
    @organisation.save
  end

  def show
    @organisation = Organisation.find_by(id: params[:id])
  end

  def update
    @organisation = Organisation.find_by(id: params[:id])
    @organisation.name = params[:name] || @organisation.name
    @organisation.hourly_rate = params[:hourly_rate] || @organisation.hourly_rate
    @organisation.save
  end

  def user_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end

end
