class Flotilla
  attr_reader :name,
              :personnel,
              :ships

  def initialize(name)
    @name = name[:designation]
    @personnel = []
    @ships = []
  end

  def add_ship(ship)
    @ships << ship
  end

  def add_personnel(person)
    @personnel << person
  end

  # def ship_specialty
  #   @ships.map do |ship|
  #    ship.requirements.map do |requirement|
  #      requirement.map do |specialty, experience|
  #        specialty
  #      end
  #    end
  #   end
  # end
  #
  # def ship_experience
  #   @ships.map do |ship|
  #    ship.requirements.map do |requirement|
  #      requirement.map do |specialty, experience|
  #        experience
  #      end
  #    end
  #   end
  # end

#if the personnel has the same required specialty and >= experience
  def recommend_personnel(spacecraft)
  require "pry"; binding.pry
  #   ship_specialties = []
  #   @ships.each do |ship|
  #     ship.requirements.each do |requirement|
  #       r
  #   # recommended_personnel = []
  #   @personnel.each do |person|
  #   if ship_specialty = personnel_specialty && personnel_experiance >= ship_experience
  #     personnel
  #
  end

  # def personnel_by_ship
  # end

end
