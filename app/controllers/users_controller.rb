class UsersController < ApplicationController

get '/signup' do   

 erb :'users/signup'
   
end 

post '/signup' do 
    #user can not create an account with blank 
    #user can not create an account with the username already exist. 

    @user= User.new(params)
     

    if  @user.username.empty? || @user.password.empty? 

    	 @error= "Please Enter the Valid Credentials"
    	 erb :'users/signup'
    elsif User.find_by(username: @user.username)

    	@error = "Account  with that User Name Already Exist"
    		 
    else 
    	 @user.save
    	session[:user_id] = @user.id
        redirect '/recipes'
    end 


    

end 




end 