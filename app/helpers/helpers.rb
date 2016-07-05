helpers do
  def current_user
    User.find(session[:id])
  end

  def checked(obj, user_input)
    if obj.answer == user_input
      guess = Guess.find_by(user_id: session[:id])
      guess.rights += 1
      guess.save
      "Correcto!"
    else 
      guess = Guess.find_by(user_id: session[:id])
      guess.wrongs += 1
      guess.save
      "La respuesta correcta es #{obj.answer}"
    end
  end

  def array_maker(user_input)
    array = []
    if user_input == "Historia"
      array = Card.where(deck_id: 1)
    elsif user_input == "Español"
      array =  Card.where(deck_id: 2)
    elsif user_input == "Matemáticas"
      array = Card.where(deck_id: 3)
    end
    array
  end  
  
end