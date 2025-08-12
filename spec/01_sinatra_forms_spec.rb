require 'rails_helper'

RSpec.describe 'Pirates Forms', type: :feature do
  describe "GET '/'" do
    before(:each) do
      visit '/'
    end

    it 'returns a 200 status code' do
      expect(page.status_code).to eq(200)
    end

    it 'renders the instructions' do
      expect(page).to have_content('Welcome to the Nested Forms Lab!')
      expect(page).to have_content("let's navigate to the '/new'")
    end
  end

  describe "GET '/new'" do
    before(:each) do
      visit '/new'
    end

    it 'returns a 200 status code' do
      expect(page.status_code).to eq(200)
    end

    it 'renders a new form element on the page' do
      expect(page).to have_css('form')
    end

    it 'renders the pirate input fields for name, weight, and height attributes on the page' do
      expect(page).to have_field('pirate[name]')
      expect(page).to have_field('pirate[weight]')
      expect(page).to have_field('pirate[height]')
    end

    it "renders the first ship's input fields for the name, type, and booty attributes on the page" do
      expect(page).to have_field('pirate[ships][][name]')
      expect(page).to have_field('pirate[ships][][type]')
      expect(page).to have_field('pirate[ships][][booty]')
    end

    it "renders the second ship's input field for the name, type, and booty attributes on the page" do
      expect(page).to have_field('pirate[ships][][name]')
      expect(page).to have_field('pirate[ships][][type]')
      expect(page).to have_field('pirate[ships][][booty]')
    end
  end

  describe "POST '/pirates'" do
    before do
      visit '/new'
      fill_in('pirate[name]', with: 'Ian')
      fill_in('pirate[weight]', with: '165')
      fill_in('pirate[height]', with: '95')
      fill_in('ship_name_1', with: 'Titanic')
      fill_in('ship_type_1', with: 'Steam Liner')
      fill_in('ship_booty_1', with: 'Silver')
      fill_in('ship_name_2', with: 'Carpathia')
      fill_in('ship_type_2', with: 'Rescue Ship')
      fill_in('ship_booty_2', with: 'Inner Tubes')
      click_button('Submit')
    end

    after do
      Ship.destroy_all
      Pirate.destroy_all
    end

    it 'returns a 200 status code' do
      expect(page.status_code).to eq(200)
    end

    it 'displays the pirate information upon form submission' do
      expect(page).to have_content('Ian')
      expect(page).to have_content('165')
      expect(page).to have_content('95')
    end

    it "displays the first ship's information upon form submission" do
      expect(page).to have_content('Titanic')
      expect(page).to have_content('Steam Liner')
      expect(page).to have_content('Silver')
    end

    it "displays the second ship's information upon form submission" do
      expect(page).to have_content('Carpathia')
      expect(page).to have_content('Rescue Ship')
      expect(page).to have_content('Inner Tubes')
    end
  end
end
