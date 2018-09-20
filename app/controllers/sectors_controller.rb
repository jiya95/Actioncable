class SectorsController < ApplicationController
  before_action :set_sector, only: [:index, :association_user_sector]
  def index
    @sectors = Sector.all
  end

  def create
    @sector = current_user.sectors.build(sector_params)
    if @sector.save
      flash[:success] = 'Chat room added!'
      redirect_to sectors_path
    else
      render 'new'
    end
  end

  def association_user_sector
   unless current_user.sectors.map(&:id).include? params[:sector_id].to_i
    current_user.sectors << Sector.find(params[:sector_id])
   end
    redirect_to sectors_path
  end
   
  def show
  @sector = Sector.includes(:messages).find_by(id: params[:id])
  @message = Message.new
  end

  private

  def set_sector
    @user_sectors = current_user.sectors
    @user_sectors ||= false
  end
  def sector_params
    params.require(:sector).permit(:title)
  end
end