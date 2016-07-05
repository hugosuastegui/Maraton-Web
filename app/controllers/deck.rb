post '/game' do
  @user_input = params[:deck_type]
  @array = array_maker(@user_input)
  erb :game
end

get '/answer' do
  user_input = params[:user_input]
  @array = array_maker(user_input)
  @answers = []
  @answers << params[:ans_0]
  @answers << params[:ans_1]
  @answers << params[:ans_2]
  @answers << params[:ans_3]
  @answers << params[:ans_4]  
  erb :answers
end
