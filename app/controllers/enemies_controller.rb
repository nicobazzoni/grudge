class EnemiesController < ApplicationController
    before_action :set_enemy, only: [:show, :edit, :update, :destroy]
    before_action :set_grudge
  
    # get "/enemys"
    def index
      if @grudge
        @enemies = @grudge.enemies
      else
        @enemies = Enemy.all
      end
      render :index
    end
  
    def show
      render :show
    end
  
    # get "/enemys/new"
    def new
      @enemy = Enemy.new
      render :new
    end
  
    # post "/enemys"
    def create
      # @enemy = enemy.create(enemy_params)
      #   if @enemy.valid?
      @enemy = Enemy.new(enemy_params)
        if @enemy.save
          redirect_to @enemy
        else
          render :new
        end
    end
  
    # get "/enemys/:id/edit"
    def edit
      render :edit
    end
  
    def update
      if @enemy.update(enemy_params)
        redirect_to @enemy
      else
        render :edit
      end
    end
  
    def destroy
      @enemy.destroy
      # add something here
      redirect_to enemys_path
    end
  
    private
  
    def set_enemy
      @enemy = Enemy.find_by(params[:id])
    end
  
    def set_grudge
      @grudge = Grudge.find_by(params[:grudge_id])
    end
  
    def enemy_params
      params.require(:enemy).permit(:name, :reason, :person_name, :threat_level, :grudge_id)
    end
  
  end