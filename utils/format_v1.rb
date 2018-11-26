require 'json'

VERSION = 'v1'.freeze

jokes_file = File.open('../jokes.json', 'r')
jokes_v1_file = File.open("../#{VERSION}/jokes.json", 'w+')

jokes = JSON.parse(jokes_file.read)['jokes']

jokes_v1 = jokes.map do |joke|
  question, answer = joke.split("\n")
  { question: question, answer: answer }
end

jokes_v1_file.write({ 'jokes' => jokes_v1 }.to_json)
