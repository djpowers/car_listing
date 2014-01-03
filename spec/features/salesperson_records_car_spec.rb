require 'spec_helper'

feature "Salesperson records car" do
  # As a car salesperson
  # I want to record a newly acquired car
  # So that I can list it in my lost

  # Acceptance Criteria:

  # I must specify the color, year, mileage of the car.
  # Only years from 1980 and above can be specified.
  # I can optionally specify a description of the car.
  # If I enter all of the required information in the required format, the car is recorded.
  # If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  # Upon successfully creating a car, I am redirected so that I can create another car.

  context "with valid attributes" do
    it 'provides a description' do
      color = 'green'
      year = 1997
      mileage = 215000
      description = 'this car runs'

      visit new_car_path
      fill_in "Color", with: color
      fill_in "Year", with: year
      fill_in "Mileage", with: mileage
      fill_in "Description", with: description
      click_on "Create Car"

      expect(page).to have_content('Car was successfully recorded.')
    end

    it 'excludes a description' do
      color = 'green'
      year = 1997
      mileage = 215000

      visit new_car_path
      fill_in "Color", with: color
      fill_in "Year", with: year
      fill_in "Mileage", with: mileage
      click_on "Create Car"

      expect(page).to have_content('Car was successfully recorded.')
    end
  end

  context "with invalid attributes" do
    it 'sees applicable errors' do
      visit new_car_path
      click_on "Create Car"

      within ".input.car_color" do
        expect(page).to have_content("can't be blank")
      end

      within ".input.car_year" do
        expect(page).to have_content("is not a number")
      end

      within ".input.car_mileage" do
        expect(page).to have_content("is not a number")
      end

    end
  end

end
