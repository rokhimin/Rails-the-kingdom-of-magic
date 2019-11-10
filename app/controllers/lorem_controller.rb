require 'faker'

class LoremController < ApplicationController
  protect_from_forgery prepend: true
  
  def generate
		type = params[:type]
		num = params[:number].to_i
    
    case type
      when 'words'
        get = Faker::Lorem.words(number: num)
        @load = get
        render "lorem/app"
      when 'setences'
        get = Faker::Lorem.sentences(number: num)
        @load = get
        render "lorem/app"
      when 'paragraph'
        get = Faker::Lorem.paragraphs(number: num)
        @load = get
        render "lorem/app"
      when 'question'
        get = Faker::Lorem.questions(number: num)
        @load = get
        render "lorem/app"
    end

  end
  
end