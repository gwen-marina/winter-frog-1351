require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'instance methods' do 
    it "can list all plants included in a garden's plots w/no duplicates, and that take less than 90 days to harvest" do 
      vail = Garden.create!(name: "Vail Garden", organic: true)
      rita = Garden.create!(name: "Rita Ranch Community Garden", organic: false)
    
      plot1 = Plot.create!(number: 1, size: "large", direction: "East", garden_id: vail.id)
      plot2 = Plot.create!(number: 2, size: "extra-small", direction: "East", garden_id: vail.id)
      plot3 = Plot.create!(number: 3, size: "medium", direction: "West", garden_id: vail.id)
      plot4 = Plot.create!(number: 4, size: "large", direction: "North", garden_id: vail.id)
      plot5 = Plot.create!(number: 5, size: "extra-small", direction: "East", garden_id:rita.id)
      plot6 = Plot.create!(number: 6, size: "small", direction: "South", garden_id: rita.id)
      plot7 = Plot.create!(number: 7, size: "extra-large", direction: "North", garden_id: rita.id)

      plant1 = Plant.create!(name: "poblano peppers", description: "Requires lots of sun.", days_to_harvest: 85)
      plant2 = Plant.create!(name: "roma tomatoes", description: "Needs lots of water.", days_to_harvest: 99)
      plant3 = Plant.create!(name: "basil", description: "Water once a day, not too much sun.", days_to_harvest: 100)
      plant4 = Plant.create!(name: "green bell peppers", description: "Not too much sun, attracts lots of bugs", days_to_harvest: 75)
      plant5 = Plant.create!(name: "jalapeños", description: "Lots of water, feed every 6 weeks.", days_to_harvest: 220)
      plant6 = Plant.create!(name: "mint", description: "Water once a day, twice in summer.", days_to_harvest: 30)
      plant7 = Plant.create!(name: "zucchini", description: "Needs lots of water.", days_to_harvest: 90)
      plant8 = Plant.create!(name: "pie pumpkin", description: "Minimal sun, lots of water", days_to_harvest: 85)
      plant9 = Plant.create!(name: "cilantro", description: "Water once a day, not too much sun.", days_to_harvest: 110)

      plot1.plants << plant1
      plot1.plants << plant2
      plot2.plants << plant3
      plot3.plants << plant1
      plot3.plants << plant4
      plot4.plants << plant5
      plot4.plants << plant6   
      plot5.plants << plant7
      plot6.plants << plant8
      plot6.plants << plant7
      plot7.plants << plant9
      plot7.plants << plant8

      expect(vail.harvest_under_hundred_days.count).to eq(4)
      expect(vail.harvest_under_hundred_days).to eq([plant1, plant2, plant4, plant6])

      expect(rita.harvest_under_hundred_days.count).to eq(2)
      expect(rita.harvest_under_hundred_days).to eq([plant7, plant8])
    end
  end
end
