#require "observe_data/version"
#require_relative"observe_data/bin"
#require_relative "version"

require 'rest-client'
require 'json'


class ObserveData
 
      
	def fetch_vin
     
     puts "I will get the datas here"

     
      	#response = JSON.parse(RestClient.get("http://api.carmd.com/v3.0/decode?vin=1GNALDEK9FZ108495", headers={"content-type":"application/json",
                                              # "authorization":"Basic ZTQzYjNhNjMtZGRjNi00ZmQzLWIyZWItNGEwYWIxMDA1MjE0",
                                              # "partner-token":"91d00755a9d94edeb60bb84527237ac4"}))

      	#puts response.code
        #puts response.header
         #puts response

       #  {"message"=>{"code"=>0, "message"=>"ok", "credentials"=>"valid", 
       #   "version"=>"v3.0.0", "endpoint"=>"decode", "counter"=>11},
        #   "data"=>{"year"=>2015, "make"=>"CHEVROLET", "model"=>"EQUINOX", 
        #    "manufacturer"=>"GENERAL MOTORS", "engine"=>"L4, 2.4L; DOHC; 16V; DI; FFV", "trim"=>"LTZ",
        #    "transmission"=>"AUTOMATIC"}}



        #api_key= "9f9604f6"

        #id="tt3896198" 

        #puts "Please Enter your title"
        
        #title= "UFO"
         #title= gets.chomp 

        #data   = JSON.parse(RestClient.get( "http://www.omdbapi.com/?i=#{id}&apikey=#{api_key}"))
    
        #data   = JSON.parse(RestClient.get( "http://www.omdbapi.com/?t=#{title}}&apikey=#{api_key}"))

        #data.each{|data|  puts "#{data}\n"} 
       # data.each{ |key,value|  puts "#{key} :#{value}" }
       
      #arr= data['Actors'].split(',')
       # arr.each{|x| puts x}

        # data["Ratings"].each{ |key,value|  puts "#{key}:#{value}" }


      #api_key="9973533"


      #https://www.thecocktaildb.com/api/json/v2/9973533/randomselection.php


   #data = JSON.parse(RestClient.get( "https://www.thecocktaildb.com/api/json/v2/9973533/randomselection.php"))

  # data["drinks"].each{|drink| puts  " #{drink["strDrink"]} \n #{drink["strGlass"]}\n #{drink["strIngredient1"]}\n #{drink["strInstructions"]}\n" }
  
  #data["drinks"].each{|drink| puts   "#{drink["strIngredient1"]}\n " }



  
  value= "FB"
  price=[]
 data = JSON.parse(RestClient.get("https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=#{value}&interval=5min&apikey=BDCRHQCT2PPUD4LT"))

 #puts data
 #data["Time Series (5min)"].each {|key,value|  value.each {|k,v|  puts "#{v.to_f}" }}
 today_volume=[]
 data["Time Series (5min)"].each {|key,value|   value.to_a}.each_with_index {|stock,index|  today_volume << "#{index} => today#{stock[1]}"} 
 
  today_volume.each {|obj| puts obj } 


data ["Time Series (5min)"].each do |time_laps| 
 


       time_laps.each {|stock|   price << stock["2. high"].to_f}

     end 
     if  price.last < price.first 
      puts "I am buying this stock"
    else 
      puts "#{price.last} has the Diffrence $$ than#{price.first}"

    end 
	end 
end 

