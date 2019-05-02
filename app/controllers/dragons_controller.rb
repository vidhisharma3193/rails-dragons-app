class DragonsController < ApplicationController


  before_action :current_dragon, only: [:show, :edit, :update, :destroy]  

  def index
    @dragons = Dragon.all
  end

  def show
  end

  def new
    @dragon = Dragon.new
    @users = User.all
  end

  def create
    @dragon = Dragon.new(dragon_params)
        if @dragon.valid?
            @dragon.save
            redirect_to @dragon
        else
            flash[:error] = @dragon.errors.full_messages
            redirect_to new_dragon_path
        end
    # @dragon = Dragon.create(dragon_params)
    # redirect_to @dragon
  end

  def edit
  end

  def update
    @dragon.update(dragon_params)
    redirect_to @dragon
  end

  def destroy
    @dragon.destroy
        redirect_to dragons_path
  end

  private
  def current_dragon
    @dragon = Dragon.find(params[:id])
end
def dragon_params
    params.require(:dragon).permit(:name, :age, :user_id)
end
end
