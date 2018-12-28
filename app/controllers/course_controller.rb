class CourseController < ApplicationController

  def top
    $quiz = Quiz.where(q_type: "5choice").where(label: "50quiz1")
    $correct = 0
    $nums = 0
    $flag = false
  end

  def update
    if $flag then
      check
    end
    $q = $quiz[$nums]
    @select = Select.new
    if $q then
     $choices = Choice.find($q.choice_id)
     $nums += 1
     $flag = true
    else
      redirect_to '/result'
    end
  end

  def check
    if $q.answer == eval("$choices.choice_#{params[:num]}") then
      $correct += 1
      p "real answer => #{$q.answer}"
      p "your answer => #{eval("$choices.choice_#{params[:num]}")}"
    end
  end
  
  def last
    @msg = "あなたは#{$nums}問中#{$correct}問正解しました。"
  end
end
