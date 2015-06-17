class Admin::LocationsController < AdminController

  before_action :set_location, except:[:new, :create, :index]

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    if @location.save
      flash[:success] = 'New Location Added!'
      redirect_to admin_locations_path
    else
      flash[:danger] = 'Failed!'
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      flash[:success] = 'Location Updated!'
      redirect_to admin_locations_path
    else
      flash[:danger] = 'Failed!'
      render :edit
    end      
  end

  def index
    @locations = Location.all.order('updated_at DESC')
  end

  def show
  end

  def destroy
    if @location.destroy
      flash[:success] = 'Location Deleted!'
    else
      flash[:danger] = 'Failed!'
    end
    redirect_to admin_locations_path
  end

  private
  def location_params
    params.require(:location).permit(:name)    
  end

  def set_location
    @location = Location.find(params[:id])
  end
end
