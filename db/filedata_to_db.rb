$data_file = [
    "ept_g4_1",
    "ept_g4_2",
    "geography1"
]

$quiz_type = [
    "4choice",
    "5choice",
    "entrybox"
]

$labels = [
    ["50quiz", 3, 1],
    ["ept", 2, 2]
]

$quiz_exp = [
    ["Countries in the World", "Choose the correct answer.","geography1"],
    ["英検４級問１", "Choose the correct answer.", "ept1"],
    ["英検４級120問", "Choose the correct answer.", "ept2"]
]

def FDhandler(table_name)
    case table_name
        when "Quiz" then
            cnt = 1
            $data_file.each do |filename|
                f = open("./db/datafile/" + filename,"r")
                f.each do |line|
                    data = line.strip!.split("^")
                    Quiz.create!(
                        q_text: data[0],
                        answer: data[data[-4].to_i],
                        choice_id: cnt,
                        q_type: data[-3],
                        label: data[-2]
                        explanation: data[-1]
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
                    cnt += 1
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
                    tittle: data[0],
                    explanation: data[1],
                    label: data[2]
                )
            end    
        else
    end
end