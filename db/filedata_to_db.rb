data_file = [
    "ept_g4"
]

quiz_type = [
    "4choice",
    "5choice",
    "entrybox"
]

labels = [
    ["50quiz", 3, 1],
    ["ept", 2, 1]
]


def FDhandler(table_name)
    case table_name
        when "Quiz" then
            cnt = 1
            data_file.each do |filename|
                f = open("datafile/" + filename,"r")
                f.each do |line|
                    data = line.split("^")
                    Quiz.create!(
                        q_text: data[0],
                        answer: data[data[-3]],
                        choice_id: cnt,
                        q_type: data[-2],
                        label: data[-1]
                    )
                    choices = [nil,nil,nil,nil,nil]
                    for n in 1...data.length-3 do
                        choices[n-1] = data[n]
                    end
                    Choice.create!(
                        choice_1: choices[0],
                        choice_2: choices[1],
                        choice_3: choices[2],
                        choice_4: choices[3],
                        choice_5: choices[4]
                    )
                end
            end

        when "Quiztype" then
            quiz_type.each do |typename|
                QuizType.create!(
                    name: typename
                )
            end

        when "Label" then
            labels.each do |label|
                Label.create!(
                    name: label[0],
                    q_types: label[1],
                    max: label[2]
                )
            end    
        else
    end
end