class UsersController < ApplicationController


get '/signup' do   
 erb :'users/signup'
end 

post '/signup' do 
    #user can not create an account with blank 
    #user can not create an account with the username already exist. 

    user= User.new(params)

    if  user.save
        session[:user_id] = user.id
        redirect '/recipes'

       #@error = " username and password can not be empty"
     else 

        @error = "Please Enter The Valid Credential"
        erb :'users/signup'
                    
    end 

  end 

end 