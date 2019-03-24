class StaticPagesController < ApplicationController
    def home
    end

    def info
      @info = Info.all
    end

    def modify
      @info = Info.all
    end

    def update
      @info = Info.all
      @info.each do |i|
        if params[i.id.to_s] then
          if !(i.use) then
            i.update(use: true)
          end
        else
          if i.use then
            i.update(use: false)
          end
        end
      end
      render :action => "info"
    end

    def create_form
    end

    def info_create
      Info.create!(
        content: params[:content],
        use: true
      )
      @info = Info.all
      render :action => "modify"
    end

    def update_form
      $i_d = Info.find(params[:id])
    end

    def info_update
      $i_d.update(
        content: params[:content],
        use: true
      )
      @info = Info.all
      render :action => "modify"
    end

    def info_destroy
      Info.find(params[:id]).destroy
      @info = Info.all
      render :action => "modify"
    end

    def help
    end

    def contact
    end

    def about
    end
end
