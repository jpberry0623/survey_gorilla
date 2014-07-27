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

  def display_question(results_hash)
    html = "<ul>Question: #{self.prompt}"
    self.choices.each do |choice|
    html += "<br><li>#{results_hash[choice.id]} people selected #{choice.label}</li>"
    end
    html += "</ul>"
  end

end
