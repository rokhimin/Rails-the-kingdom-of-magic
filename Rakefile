# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
task :default => [:welcome]

require_relative 'config/application'

Rails.application.load_tasks

task :s do
  sh 'rails s -b 0.0.0.0 -p 3000'
end

task :welcome do
  puts "hi follow my twitter https://twitter.com/rokhiminwahid"
end