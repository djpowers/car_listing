require 'spec_helper'

describe Car do

  describe "validations" do
    it { should validate_presence_of :color }
    it { should validate_numericality_of :year }
    it { should_not have_valid(:year).when(1979, 0, 1000, -1) }
    it { should validate_numericality_of :mileage }
    it { should_not have_valid(:mileage).when(-1, -500) }
  end

  describe "database checks" do
    it { should have_db_column(:color).of_type(:string).with_options(null: false) }
    it { should have_db_column(:year).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:mileage).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:description).of_type(:text) }
  end

end
