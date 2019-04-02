class QuizDataInsertController < ApplicationController
  def index
  end

  def insert
    file_data = []
    file_names = []
    params[:fd].each do |f|
      file_data << f.read
      file_names << f.original_filename
    end
    vald = []
    open("./data/fn.txt").each do |fn|
      vald << fn
    end
    file_data.zip(file_names) do |fd,fn|
      if vald.include?(fn) then
        next
      else
        open("./data/fn.txt","a").write(fn+"\n")
      end
      fd.split("\r\n").each do |line|
        begin
          p line
          data = line.split("^")
          k = data[8]
          l = Label.find_by(name: data[-2].sub(/\d{,4}$/,""))
          choices = [nil,nil,nil,nil,nil]
          for n in 1...data.length-4 do
              choices[n-1] = data[n]
          end
          c = Choice.new(
                choice_1: choices[0],
                choice_2: choices[1],
                choice_3: choices[2],
                choice_4: choices[3],
                choice_5: choices[4]
              )
          c.save
          Quiz.create!(
              q_text: data[0],
              answer: data[data[-4].to_i],
              choice_id: c.id,
              q_type: data[-3],
              label: data[-2],
              explanation: data[-1]
          )
        rescue Exception => e
          raise $!, "error #{$!}", $!.backtrace
        end
      l.max += 1
      l.save
      end
    end
    if !params[:exist] then
      QuizExp.create!(
        title: params[:titls],
        explanation: params[:exp],
        label: l.name
      )
    end
    redirect_to '/datainsert'
  end
end
