$quiz_type = [
    "5choice",
    "4choice",
    "entrybox"
]

$labels = [
    ["ept_g4", 2, 9],
    ["ept_g5", 2, 23],
    ["geography", 2, 1]
]

$quiz_exp = [
    ["Countries in the World", "Choose the correct answer.","geography"],
    ["英検４級過去問　大問１", "Choose the correct answer.", "ept_g4"],
    ["英検５級過去問　大問１", "Choose the correct answer.", "ept_g5"]
]

def FDhandler(table_name)
    case table_name
        when "Quiz" then
            cnt = 1
            $labels.each do |d|
                for n in 1..d[2]
                    f = open("./db/datafile/" + d[0]+ "_" + n.to_s,"r")
                    f.each do |line|
                        data = line.strip!.split("^")
                        Quiz.create!(
                            q_text: data[0],
                            answer: data[data[-4].to_i],
                            choice_id: cnt,
                            q_type: data[-3],
                            label: data[-2],
                            explanation: data[-1]
                        )
                        choices = [nil,nil,nil,nil,nil]
                        for n in 1...data.length-4 do
                            choices[n-1] = data[n]
                        end
                        Choice.create!(
                            choice_1: choices[0],
                            choice_2: choices[1],
                            choice_3: choices[2],
                            choice_4: choices[3],
                            choice_5: choices[4]
                        )
                        cnt += 1
                    end
                end
            end

        when "Quiztype" then
            $quiz_type.each do |typename|
                QuizType.create!(
                    name: typename
                )
            end

        when "Label" then
            $labels.each do |label|
                Label.create!(
                    name: label[0],
                    q_types: label[1],
                    max: label[2]
                )
            end

        when "Quizexp" then
            $quiz_exp.each do |data|
                QuizExp.create!(
                    title: data[0],
                    explanation: data[1],
                    label: data[2]
                )
            end
        else
    end
end
