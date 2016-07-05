# before '/users/:id' do
#   unless session[:id]
#     redirect to '/'
#   end
# end

get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end


post '/login' do
  @error_message = ""
  email = params[:email]
  password = params[:password]
#buscar sio existe el usuario
  user = User.authenticate(email, password)
  if user 
      session[:id] = user.id
     redirect to "/users/#{user.id}"
  else
#obtener id y email para crear sesión
  @error_message = "Usuario Inválido"
    erb :index
  end
end

post '/register' do
  email = params[:email]
  password = params[:password]
  u = User.new(email: email, password: password)
  if u.save
    session[:id] = u.id
    guess = Guess.create(user_id: session[:id])
    @bulean = true
    erb :index
  end
end

get '/logout' do
  session.clear
  @bulean2 = true
  erb :index
end

get '/stats/:id' do
  @guess = Guess.find_by(user_id: session[:id])
  erb :stats
end