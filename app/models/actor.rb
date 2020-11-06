require 'pry'
class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    name = "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    roles = []
    character = self.characters.collect do |t|
        t.name
    end
    show = self.shows.collect do |s|
        s.name
    end
    role = character.concat show
    roles << role.join(" - ")
    roles
  end
end