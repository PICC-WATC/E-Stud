require("./app/controllers/controllers_g_var.rb")
class CourseController < ApplicationController
  before_action :logged_in_user

  def top
    if params[:commit] == "問題へ" then
      $quiz = Quiz.where(q_type: "4choice").where(label: $name_trans[params[:label_name]] + params[:num])
      $q_exp = QuizExp.find_by(label: $name_trans[params[:label_name]])
      $correct = 0
      $nums = 0
      $answer_table = []
      $checker = []
    else
      redirect_to '/choose_course'
    end
  end

  def update
    if $nums != 0
      check
    end
    $q = $quiz[$nums]
    @select = Select.new
    if $q then
     choices = Choice.find($q.choice_id)
     $choices = []
     (1..4).each do |n|
       $choices << eval("choices.choice_#{n}")
     end
      $choices.shuffle!
     $nums += 1
    else
      redirect_to '/result'
    end
  end

  def check
    r_answer = $q.answer
    begin
      u_answer =  $choices[params[:num].to_i-1]
      if r_answer == u_answer then
        $correct += 1
        $checker.push(true)
      else
        u_answer = "<font color='red'>#{u_answer}</font>"
        $checker.push(false)
      end
    rescue => exception
      u_answer = ""
      $checker.push(false)
    end
    $answer_table.push([$nums,$q.q_text,r_answer,u_answer,$q.explanation])
  end

  def show
    data = params[:data]
    @select = data[2]
    if @select.include?("<") then
      @select = @select.split(">")[1].split("<")[0]
    end
    @q = $quiz[data[0].to_i-1]
    choices = Choice.find(@q.choice_id)
    @choices = []
    (1..5).each do |n|
      @choices.push(eval("choices.choice_#{n}"))
    end
  end

  def history_create
    History.create!(
                    label: $label,
                    q_type: $q_type,
                    usr_id: $usr_id)
  end

  def usr_q_data_create
    (0..$quiz.length-1).each do |n|
      q = $quiz[n]
      old_data = UserQuizDatum.where(usr_id: $usr_id).find_by(q_id: q.id)
      if old_data then
        if $checker[n] then
          old_data.continuity += 1
          old_data.correct += 1
        else
          old_data.continuity = 0
          old_data.miss += 1
        end
        new_data = old_data
        if new_data.continuity > 5 or 4*new_data.miss < new_data.correct then
          new_data.clear = true
        end
        new_data.save
      else
        conti = 0
        corr = 0
        mis = 0
        if $checker[n] then
          conti = 1
          corr = 1
        else
          mis = 1
        end
        UserQuizDatum.create!(
                      usr_id: $usr_id,
                      q_id: q.id,
                      continuity: conti,
                      correct: corr,
                      miss: mis,
                      clear: false)
      end
    end
  end

  def last
    history_create
    usr_q_data_create
    @msg = "あなたは#{$nums}問中#{$correct}問正解しました。"
  end

  private
    
    #ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end

    #正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
