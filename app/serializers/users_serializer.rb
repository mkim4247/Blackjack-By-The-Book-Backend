class UsersSerializer < ActiveModel::Serializer
  attributes :id, :username, :pot, :wins, :games_played, :current_streak, :longest_streak, :largest_pot
end
