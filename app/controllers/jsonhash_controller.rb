require 'json'

class JsonhashController < ApplicationController
  protect_from_forgery prepend: true
    
  def parsing
		get = params[:json]
    get.each do |x|
      begin
       @load = JSON.parse(x[1])
      rescue JSON::ParserError
       @load = "Parse error"
       render "jsonhash/app"
      else
       render "jsonhash/app"
      end
    end
  end
      
end