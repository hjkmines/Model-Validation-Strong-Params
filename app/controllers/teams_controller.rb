class TeamsController < ApplicationController

  def index 
    @teams = Team.all 
    render json: @teams
  end 

  def show 
    @team = Team.find(params[:id])
    render json: @team 
  end 

  def create      
    @team = Team.create(
      name: params[:name]
    )

    render json: @team
    # redirect_to "http://localhost:3001"
  end 

  def update 
    @team = Team.find(params[:id])
    @team = Team.update(
      name: params[:name]
    )
    render json: @team 
  end 

  def destroy 
    @teams = Team.all 
    @team = Team.find(params[:id])
    @team.destroy 
    render json: @teams 
  end 

end
