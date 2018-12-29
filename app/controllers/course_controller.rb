class CourseController < ApplicationController

  def top
    $q_type = "5choice"
    $label = "50quiz" + "1"
    $usr_id = 1
    $quiz = Quiz.where(q_type: $q_type).where(label: $label)
    $correct = 0
    $nums = 0
    $answer_table = []
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
      r_answer = $q.answer
      u_answer =  eval("$choices.choice_#{params[:num]}")
      if r_answer == u_answer then
        $correct += 1
      else
        u_answer = "<font color='red'>#{u_answer}</font>"
      end
      $answer_table.push([$nums,r_answer,u_answer])
      p $answer_table
  end
  
  def show
    data = params[:data]
    @select = data[2]
    if @select.include?("<") then
      @select = @select.split(">")[1].split("<")[0]
    end
    p data[2]
    @q = $quiz[data[0].to_i-1]
    choices = Choice.find(@q.choice_id)
    @choices = []
    (1..5).each do |n|
      @choices.push(eval("choices.choice_#{n}"))
    end
  end

  def last
    @msg = "あなたは#{$nums}問中#{$correct}問正解しました。"
  end
end
