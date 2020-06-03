class SessionsController < ApplicationController
 
 get'/login' do 
 	erb :'users/login'
 end 

post '/login' do 

	if  params[:username].empty? || params[:password].empty? 

    	 @error= "User Name and Password can't be blank"

    	 erb :'users/login'

    elsif  @user=User.find_by(username: params[:username], password: params[:password])

             session[:user_id] = @user.id
             redirect '/recipes'
     else 
     	@error ="Account not found "
     	  erb :'users/login'

    end 
  end 

  get'/logout'   do 
  	session.clear
  	redirect '/'
  end 

end 