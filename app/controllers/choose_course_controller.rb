require("./app/controllers/controllers_g_var.rb")
class ChooseCourseController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @labels_ja = []
    Label.all.each do |ld|
      @labels_ja << $name_trans[ld.name]
    end
  end

  def get_num
    render partial: 'select_num', locals: { label_name: $name_trans[params[:label_name]] }
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

    #ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end

end
