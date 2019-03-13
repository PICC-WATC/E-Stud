class ChooseCourseController < ApplicationController
  def top
    @l_data = Label.all
    $labels = []
    @l_data.each do |ld|
      $labels << ld.name
    end
  end

  def update
    data = { :text => params[:label] }
    render partial: 'ajax_partial', locals: { :data => data }
  end

  def dynamic_course_list
  end

  private
    def make_q_types
      types = ["5choice", "enterybox"]
      flag = Label.find(params[:label]).q_types #q_typesがbitflagになっているので
      for i in 0...types.size
        if(flag % 2 == 1)
          q_types << types[i]
        end
        flag = (flag / 2).to_i
      end
      return q_types
    end
end
