require 'discordrb/webhooks'

class DiscordController < ApplicationController
  protect_from_forgery prepend: true
  
  	def post
		
		discord_url = params[:url]
		discord_username = params[:username]
		discord_avatar_url = params[:avatar_url]
		discord_color = params[:color]
		discord_title = params[:title]
		discord_url_title = params[:url_title]
		discord_desc = params[:desc]
		discord_image = params[:image]
		discord_thumbnail = params[:thumbnail]
		discord_author_name = params[:author_name]
		discord_author_url = params[:author_url]
		discord_author_icon_url = params[:author_icon_url]
		discord_footer = params[:footer]
		discord_icon_footer = params[:icon_footer]
		discord_field_name = params[:field_name]
		discord_field_value = params[:field_value]
		
		begin
			discord_url.each do |x|

      @discord_url = "url webhook : #{x[1]}"
        
			client = Discordrb::Webhooks::Client.new(url: x[1])
			client.execute do |builder|
			discord_username.each do |x|
			  builder.username = "#{x[1]}"
			end
			discord_avatar_url.each do |x|
			  builder.avatar_url = "#{x[1]}"
			end
			  builder.add_embed do |embed|
        
				embed.colour = discord_color
				  
				discord_title.each do |x|
					embed.title = "#{x[1]}"
				end
				  
				discord_url_title.each do |x|
					embed.url = "#{x[1]}"
				end
				  
				discord_desc.each do |x|
					embed.description = "#{x[1]}"
				end
				  
				discord_image.each do |x|
					embed.image = Discordrb::Webhooks::EmbedImage.new(url: "#{x[1]}")
				end
				  
				discord_thumbnail.each do |x|
 					embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: "#{x[1]}")
				end
				
				discord_author_url.each do |x|
					@sigil_author_url = x[1]
				end
				discord_author_icon_url.each do |x|
					@sigil_author_icon_url = x[1]
				end
				  
				discord_author_name.each do |x|
					embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "#{x[1]}", url: "#{@sigil_author_url}", icon_url: "#{@sigil_author_icon_url}")
				end
				  
				discord_icon_footer.each do |x|
					@sigil_icon_footer = x[1]
				end
					
				discord_footer.each do |x|
  					embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: "#{x[1]}", icon_url: "#{@sigil_icon_footer}")
				end
				  
				discord_field_value.each do |x|
					@sigil_field_value = x[1]
				end
				  
				discord_field_name.each do |x|
					unless @sigil_field_value == ''
				    	embed.add_field(name: "#{x[1]}", value: "#{@sigil_field_value}")
					else
					end
				end

			  end
			end 
			end

    # Error Handling
		rescue URI::InvalidURIError
        @discord_response = 'HTTP Status : 502 Bad gateway'
        render "discord/app"
		rescue RestClient::NotFound
        @discord_response = 'HTTP Status : 404 Not Found'
        render "discord/app"
		rescue RestClient::BadRequest
        @discord_response = 'HTTP Status : 400 Bad Request'
        render "discord/app"
		rescue RestClient::Unauthorized
        @discord_response = 'HTTP Status : 401 Unauthorized'
        render "discord/app"
		rescue SocketError
        @discord_response = 'HTTP Status : Socket error'
        render "discord/app"
		else
        @discord_response = 'HTTP Status : 200 ok'
        render "discord/app"
		end
		
	end
  
end
