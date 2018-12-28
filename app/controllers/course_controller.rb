class CourseController < ApplicationController

  def top
    $q_type = "5choice"
    $label = "50quiz" + "1"
    $usr_id = 1
    $quiz = Quiz.where(q_type: $q_type).where(label: $label)
    $correct = 0
    $nums = 0
  end

  def update
    $q = $quiz[$nums]
    @select = Select.new
    if $q then
     $choices = Choice.find($q.choice_id)
     $nums += 1
    else
      redirect_to '/result'
    end
  end

  def check
    begin
      if $q.answer == eval("$choices.choice_#{params[:num]}") then
        $correct += 1
        p "real answer => #{$q.answer}"
        p "your answer => #{eval("$choices.choice_#{params[:num]}")}"
      end 
    rescue => exception
    end
  end
  
  def last
    @msg = "あなたは#{$nums}問中#{$correct}問正解しました。"
  end
end
