class QuestionsController < ApplicationController

  def answer
    @question = params[:question]
    @answer = coach_answer(@question)
    if @answer.empty?
      redirect_to success_path
    end
  end

  def ask
  end

  def success
  end

private

  def coach_answer(question)
    if question == question.upcase
      enhanced_message(question)
    else
      message(question)
    end
  end

  def enhanced_message(question)
    if question == "I AM GOING TO WORK RIGHT NOW!"
      return ""
    else
      return "I can feel your motivation! " + message(question)
    end
  end

  def message(question)
    if question.include? "?"
      return "Silly question, get dressed and go to work!"
    elsif question == "I am going to work right now!"
      return ""
    else
      return "I don't care, get dressed and go to work!"
    end
  end

end
