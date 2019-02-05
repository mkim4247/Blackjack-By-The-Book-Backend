class Api::V1::GamesController < ApplicationController

  def create
    @game = Game.create(game_params)
    if @game.valid?
      render json: { game: GamesSerializer.new(@game)}, status: :accepted
    else
      render json: { errors: @game.errors.full_messages }
    end 
  end

  private

  def game_params
    params.require(:game).permit(:result, :user_id)
  end

end
