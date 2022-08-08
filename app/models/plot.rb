class Plot < ApplicationRecord
  belongs_to :garden
  has_many :plant_plots
  has_many :plants, :through => :plant_plots

  def self.plants_sorted_by_count
    joins(:plants)
      .distinct
      .select('plots.*, count(plants) AS plant_count')
      .group(:id)
      .order(plant_count: :desc)
  end
end

