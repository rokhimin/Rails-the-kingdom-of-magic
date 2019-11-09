require 'json'

class JsonhashController < ApplicationController
  protect_from_forgery prepend: true
  
  def app
  end
    
  def response
		#get = params[:json]
      #load = JSON.parse(get)
    
			#render plain: "x"
  end
      
end