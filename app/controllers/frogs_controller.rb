class FrogsController < ApplicationController

  def index
  @frogs = Frog.all

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @frogs }
    end
  end 
  
  def show
    @frog = Frog.find(params[:id]) 
  end

  def new
    @frog = Frog.new
    @ponds = Pond.all
  end

  def create
    @frog = Frog.new(frog_params)
    if @frog.save
    redirect_to frog_path(@frog), notice: "You just made a frog!"
    else
    redirect_to new_frog_path
    end
  end
#since there's a resources, automatically creates a path

#the conditional is so we can react to the user info

  def edit
    @frog = Frog.find(params[:id])
    @ponds = Pond.all
  end
#edit- gives us the interface to update
  def update
    @frog = Frog.find(frog_params[:id])
    @frog.assign_attributes(name: params[:name])
    if @frog.save
      redirect_to frog_path(@frog)
    else
      redirect_to edit_frog_path(@frog), notice: "I'm gonna git you sucka!!!"
       
     end 
  end

#update takes the information and updates it

  def destroy
    @frog= Frog.find(params[:id])
    @frog.destroy
    redirect_to frogs_path
  end
private

#to tell rails this isnt an action; to tell us its a private method that we're planning to use inside

  def frog_params
    params.require(:frog).permit(:name, :color, :pond_id)
  end
#require is a method that belongs ti the params hash only allows th? require and permit need to be together
end

#instance variable so the views can see them