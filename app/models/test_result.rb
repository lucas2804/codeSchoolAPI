class TestResult < ActiveRecord::Base
  has_many :questions
  has_many :tests
  has_many :users
  has_many :answers

  validates :question_id, :test_id, :user_id, :answer_id, presence: true
  validates_uniqueness_of :question_id, scope: :user_id
end
