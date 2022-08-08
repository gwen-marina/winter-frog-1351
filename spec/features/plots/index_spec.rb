require 'rails_helper' 

RSpec.describe "Plots Index Page" do 

# User Story 1, Plots Index Page
# As a visitor
# When I visit the plots index page ('/plots')
# I see a list of all plot numbers
# And under each plot number I see names of all that plot's plants
  it "can list all plot numbers and all that plot's plants" do 

    vail = Garden.create!(name: "Vail Garden", organic: true)
    rita = Garden.create!(name: "Rita Ranch Community Garden", organic: false)
    cfms = Garden.create!(name: "CFMS School Garden", organic: true)

    plot1 = Plot.create!(number: 1, size: "large". direction: "East", garden_id: vail.id)
    plot2 = Plot.create!(number: 2, size: "extra-small". direction: "East", garden_id: vail.id)
    plot3 = Plot.create!(number: 3, size: "medium". direction: "West", garden_id: rita.id)
    plot4 = Plot.create!(number: 4, size: "large". direction: "North", garden_id: rita.id)
    plot5 = Plot.create!(number: 5, size: "extra-small". direction: "East", garden_id:cfms.id)
    plot6 = Plot.create!(number: 6, size: "small". direction: "South", garden_id: cfms.id)
    plot7 = Plot.create!(number: 7, size: "extra-large". direction: "North", garden_id: cfms.id)

    plot1.plants.create!(name: "roma tomatoes", description: "Needs lots of water.", days_to_harvest: 90)
    plot1.plants.create!(name: "poblano peppers", description: "Requires lots of sun.", days_to_harvest: 110)
    plot2.plants.create!(name: "basil", description: "Water once a day, not too much sun.", days_to_harvest: 100)

    plot3.plants.create!(name: "green bell peppers", description: "Not too much sun, attracts lots of bugs", days_to_harvest: 105)
    plot4.plants.create!(name: "jalapeños", description: "Lots of water, feed every 6 weeks.", days_to_harvest: 220)
    plot4.plants.create!(name: "mint", description: "Water once a day, twice in summer.", days_to_harvest: 300)

    plot5.plants.create!(name: "zucchini", description: "Needs lots of water.", days_to_harvest: 90)
    plot6.plants.create!(name: "pie pumpkin", description: "Minimal sun, lots of water", days_to_harvest: 85)
    plot7.plants.create!(name: "cilantro", description: "Water once a day, not too much sun.", days_to_harvest: 110)

    visit '/plots'

    expect(page).to have_content("plot number: 1")
    expect(page).to have_content("plant: roma tomatoes")
    expect(page).to have_content("plant: poblano peppers")
    expect(page).to have_content("plot number: 2")
    expect(page).to have_content("plant: basil")
    expect(page).to have_content("plot number: 3")
    expect(page).to have_content("plant: green bell peppers")
    expect(page).to have_content("plot number: 4")
    expect(page).to have_content("plant: jalapeños")
    expect(page).to have_content("plant: mint")
    expect(page).to have_content("plot number: 5")
    expect(page).to have_content("plant: zucchini")
    expect(page).to have_content("plot number: 6")
    expect(page).to have_content("plant: pie pumpkin")
    expect(page).to have_content("plot number: 7")
    expect(page).to have_content("plant: cilantro")  
  end
end

