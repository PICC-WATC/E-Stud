class ChooseCourseController < ApplicationController
  def index
    @labels = []
    Label.all.each do |ld|
      @labels << ld.name
    end
  end

  def get_num
    render partial: 'select_num', locals: { label_name: params[:label_name] }
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
