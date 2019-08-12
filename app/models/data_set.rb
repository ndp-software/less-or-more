class DataSet < ApplicationRecord
  belongs_to :reference
  has_many :data_points
end
