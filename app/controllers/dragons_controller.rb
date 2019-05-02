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
    end

    def create
        @dragon= Dragon.new(dragon_params)
        # byebug
        if @dragon.valid?
            @dragon.save
            redirect_to @dragon
        else 
            flash[:error] = @dragon.errors.full_messages
            redirect_to new_dragon_path
        end
    end

    def edit
        @dragon = Dragon.find(params[:id])
    end

    def update
        @dragon = Dragon.find(params[:id])
        @dragon.update(dragon_params)
        if @dragon.valid?
            @dragon.save
            redirect_to @dragon
        else
            flash[:error] = @dragon.errors.full_messages
            redirect_to edit_dragon_path
        end
    end

    def destroy
        @dragon = Dragon.find(params[:id])
        @dragon.destroy
        redirect_to dragons_path
    end

    private
    def dragon_params
        params.require(:dragon).permit(:name, :age, :user_id)
    end
end
