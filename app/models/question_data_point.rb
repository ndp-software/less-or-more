class QuestionDataPoint < ApplicationRecord
  belongs_to :question
  belongs_to :data_point
end
