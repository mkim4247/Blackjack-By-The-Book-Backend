class UsersSerializer < ActiveModel::Serializer
  attributes :id, :username, :longest_streak, :largest_pot
  has_many :games
end
