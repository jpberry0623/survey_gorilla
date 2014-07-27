class User < ActiveRecord::Base
	has_secure_password
  has_many :results
  has_many :surveys
  has_one :region

  def taken_surveys(idnum)
    results = Result.where(user_id: idnum)
    choice_ids = results.each_with_object([]) { |r, a| a << r.choice_id  }
    choice_objs = choice_ids.each_with_object([]) { |c, a| a << Choice.find(c)  }
    question_ids = choice_objs.each_with_object([]) { |c, a| a << c.question_id  }.uniq

    question_objs = question_ids.each_with_object([]) { |q, a| a << Question.find(q)  }
    survey_ids = question_objs.each_with_object([]) { |q, a| a << q.survey_id  }.uniq
    survey_objs = survey_ids.each_with_object([]) { |s, a| a << Survey.find(s)  }
    return survey_objs
  end

end
