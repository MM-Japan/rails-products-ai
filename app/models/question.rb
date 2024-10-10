class Question < ApplicationRecord
  belongs_to :user
  validates :user_question, presence: true
  # app/models/question.rb
  after_create :fetch_ai_answer

  private

  def fetch_ai_answer
    ChatbotJob.perform_later(self)
  end

end
