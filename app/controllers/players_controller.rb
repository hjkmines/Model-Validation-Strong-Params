class PlayersController < ApplicationController
  def index
    if params[:search_params]
      @players = Player.where("last_name LIKE ?", "%#{params[:search_params]}%")
    else  
    @players = Player.all 
    render json: @players 
  end 

  def show 
    @player = Player.find(params[:id])
    render json: @player
  end 

  def create 
    @player = Player.create(player_params)

    render json: @player
  end 

  def update 
    @player = Player.find(params[:id])
    @player.update(
      name: params[:id], 
      number: params[:number], 
      team_id: params[:team_id]
    )

    render json: @player 
  end 

  def destroy 
    @players = Player.all 
    @player = Player.find(params[:id])
    @player.destroy 
    render json: @players
  end 

  private

  def player_params 
    params.require(:player).permit(:name, :number, :team_id)
  end 

end
