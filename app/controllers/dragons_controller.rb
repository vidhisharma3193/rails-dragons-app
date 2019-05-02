class DragonsController < ApplicationController
  def index
    @dragons = Dragon.all
  end

  def show
    @dragon = Dragon.find(params[:id])
    @user = @dragon.user
  end

  def new
    @dragon = Dragon.new
    prep_form
  end

  def create
    @dragon = Dragon.new(dragon_params)
    prep_form
    if @dragon.valid?
      @dragon.save
      redirect_to dragon_path(@dragon)
    else
      render :new
    end
  end

  def edit
    @dragon = Dragon.find(params[:id])
    prep_form
  end

  def update
    @dragon = Dragon.find(params[:id])
    prep_form
    @dragon.assign_attributes(dragon_params)
    if @dragon.valid?
      @dragon.save
      redirect_to dragon_path(@dragon)
    else
      render :edit
    end
  end

  def destroy
    @dragon = Dragon.find(params[:id])
    @dragon.destroy
    redirect_to dragons_path
  end

  private

  def dragon_params
    params.require(:dragon).permit(:name,:age,:user_id)
  end
  
  def prep_form
    @all_users = User.all
    @user = (@dragon.user || User.all.first) || User.new
  end
end
