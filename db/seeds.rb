Deck.create(subject: "Historia")
Deck.create(subject: "Matemáticas")
Deck.create(subject: "Español")
  
CSV.foreach("Preguntas.csv") do |pregunta|
  card = Card.create(question: pregunta[0], answer: pregunta[1], deck_id: pregunta[2])
end


