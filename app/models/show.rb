require 'pry'
class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network

  def actors_list
    actor_full_name = []
    actor_first_name = self.actors.collect do |f| 
        f.first_name
    end
    actor_last_name = self.actors.collect do |l|
        l.last_name
    end
    actor_name = actor_first_name + actor_last_name
    actor_full_name << actor_name.join(" ")
    actor_full_name 
  end
end

