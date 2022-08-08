class Garden < ApplicationRecord
  has_many :plots
  has_many :plant_plots, :through => :plots
  has_many :plants, :through => :plant_plots

  def harvest_under_hundred_days
    plants.where('days_to_harvest < 100').uniq
  end
end
