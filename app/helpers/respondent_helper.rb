def create_selections_for_respondent(survey_id)
  @survey = Survey.find_by(id: params[:survey_id])
  @questions = @survey.questions
  @questions.each do |question|
  r = Selection.create(completion: compl, choice: c1)
  end
end