require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :days_to_harvest}
  end

  describe "relationships" do
    it { should have_many(:plant_plots) }
    it { should have_many(:plots) }
  end
end
