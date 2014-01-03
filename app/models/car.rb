class Car < ActiveRecord::Base

  validates_presence_of :color
  validates_numericality_of :year, greater_than_or_equal_to: 1980
  validates_numericality_of :mileage, greater_than_or_equal_to: 0


end
