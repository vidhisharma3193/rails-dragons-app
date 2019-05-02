class DragonsController < ApplicationController

  def index
    @dragons = Dragon.all
  end

  def show
    @dragon = Dragon.find(params[:id])
  end

  def new
    @dragon = Dragon.new
    @users = User.all
  end


  def create
    @dragon = Dragon.create(dragon_params)
    if @dragon.valid?
      @dragon.save
      redirect_to @dragon
    else flash[:error] = @dragon.errors.full_messages
      redirect_to new_dragon_path
    end
  end

  def edit
    @dragon = Dragon.find(params[:id])
    @users = User.all


  end


  def update
    @dragon = Dragon.find(params[:id])
    if @dragon.valid?
      @dragon.update(dragon_params)
      redirect_to dragon_path(@dragon)
    else flash[:error] = @dragon.errors.full_messages
      redirect_to edit_dragon_path(@dragon)
    end

  end

  def destroy
    @dragon = Dragon.find(params[:id])
    @dragon.destroy
    redirect_to dragons_path

  end

  private

  def dragon_params
    params.require(:dragon).permit(:name,:age, :user_id)

  end


end
