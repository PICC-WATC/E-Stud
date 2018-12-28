# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Administrator",
             email: "admin@picc.com", 
             password: "dododo",
             password_confirmation: "dododo", 
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

Label.create!(
                name: "50quiz",
                q_type: 1
                max: 1)

QuizType.create!(
                name: "5choice")
               
QuizType.create!(
                name: "entrybox")

Quiz.create!(
                q_text: "What is my favorite color?",
                answer: "blue",
                choice_id: 1,
                q_type: "5choice",
                label: "50quiz1")
Quiz.create!(
                q_text: "What is my favorite sweet?",
                answer: "cookie",
                choice_id: 2,
                q_type: "5choice",
                label: "50quiz1")
Quiz.create!(
                q_text: "What is my favorite game?",
                answer: "RPG",
                choice_id: 3,
                q_type: "5choice",
                label: "50quiz1")
Quiz.create!(
                q_text: "What is my favorite flower?",
                answer: "cherry-sage",
                choice_id: 4,
                q_type: "5choice",
                label: "50quiz1")
Quiz.create!(
                q_text: "What is my favorite word?",
                answer: "twilight",
                choice_id: 5,
                q_type: "5choice",
                label: "50quiz1")

Choice.create!(
                choice_1: "red",
                choice_2: "blue",
                choice_3: "yellow",
                choice_4: "green",
                choice_5: "white")
Choice.create!(
                choice_1: "cookie",
                choice_2: "cake",
                choice_3: "mashmallow",
                choice_4: "pie",
                choice_5: "pudding")
Choice.create!(
                choice_1: "action",
                choice_2: "shooting",
                choice_3: "RPG",
                choice_4: "adventure",
                choice_5: "race")
Choice.create!(
                choice_1: "lilly",
                choice_2: "rose",
                choice_3: "cherry-sage",
                choice_4: "forget-me-not",
                choice_5: "pinapple")
Choice.create!(
                choice_1: "strike",
                choice_2: "right",
                choice_3: "queen",
                choice_4: "twilight",
                choice_5: "honnor")
