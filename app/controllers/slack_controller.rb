require 'slack/incoming/webhooks'

class SlackController < ApplicationController
  protect_from_forgery prepend: true
  
  	def post
      
		slack_url = params[:url]
		slack_username = params[:username]
		slack_color = params[:color]
		slack_title = params[:title]
		slack_url_title = params[:url_title]
		slack_post = params[:post]
		slack_text = params[:text]
		slack_image = params[:image]
		
		slack_url.each do |x|
    @slack_url = x[1]
		@slack = Slack::Incoming::Webhooks.new "#{x[1]}"
		end

		slack_username.each do |x|
			@sigil2_username = x[1]
		end
  
			@sigil2_color = slack_color
  
		slack_title.each do |x|
			@sigil2_title = x[1]
		end
		slack_url_title.each do |x|
			@sigil2_url_title = x[1]
		end
		slack_post.each do |x|
			@sigil2_post = x[1]
		end
		slack_text.each do |x|
			@sigil2_text = x[1]
		end
		slack_image.each do |x|
			@sigil2_image = x[1]
		end
		
		begin
			
		attachments = {
		  color: "#{@sigil2_color}",
		  title: "#{@sigil2_title}",
		  title_link: "#{@sigil2_url_title}",
		  text: "#{@sigil2_text}",
		  image_url: "#{@sigil2_image}"
		}

		@slack.username = "Mahad-#{@sigil2_username}"
		@slack.post "#{@sigil2_post}", attachments: [attachments]
			
		rescue NoMethodError
        @slack_response = 'Status : NoMethodError'
        render "slack/app"
		else
        @slack_response = 'HTTP Status : 200 ok'
        render "slack/app"
			
		end
    end
end
