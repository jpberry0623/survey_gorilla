class Question < ActiveRecord::Base
  has_one :question_type
  has_many :choices
  belongs_to :survey

  def prepare_chart(results_hash)
    data = []
    self.choices.each do |choice|
      data << [choice.label, results_hash[choice.id]]
    end
    return data
  end

end
