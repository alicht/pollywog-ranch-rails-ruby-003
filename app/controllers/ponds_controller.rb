class PondsController < ApplicationController

  def index
  @ponds = Pond.all

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @ponds }
    end
  end 
  
  def show
    @pond = Pond.find(params[:id]) 
  end

  def new
    @pond = Pond.new
    # @ponds = Pond.all
  end

  def create
    @pond = Pond.new(pond_params)
    if @pond.save
    redirect_to pond_path(@pond)
    else
    redirect_to new_pond_path
    end
  end
#since there's a resources, automatically creates a path

#the conditional is so we can react to the user info

  def edit
    @pond = Pond.find(params[:id])
    # @ponds = Pond.all
  end
#edit- gives us the interface to update
  def update
    @pond = Pond.find(params[:id])
    @pond.assign_attributes(pond_params)
    if @pond.save
      redirect_to pond_path(@pond)
    else
      redirect_to pond_path
       
     end 
  end

#update takes the information and updates it

  def destroy
    @pond= Pond.find(params[:id])
    @pond.destroy
    redirect_to ponds_path
  end
private

#to tell rails this isnt an action; to tell us its a private method that we're planning to use inside

  def pond_params
    params.require(:pond).permit(:name, :water_type)
  end
#require is a method that belongs ti the params hash only allows th? require and permit need to be together
end
