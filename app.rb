require 'sinatra'
require 'subprocess'

get '/' do
  "Howdy!"
end

get '/hi' do
  "Hello World!"
end

get '/green_on' do
	begin
	  Subprocess.check_call(['ruby', 'light.rb', '12', 'on'])
	  return "Success"
	rescue Subprocess::NonZeroExit => e
	  puts e.message
	  puts "Unable to communicate with device"
	  return "OH NOES!"
	end
end
get '/green_off' do
	begin
	  Subprocess.check_call(['ruby', 'light.rb', '12', 'off'])
	  return "Success"
	rescue Subprocess::NonZeroExit => e
	  puts e.message
	  puts "Unable to communicate with device"
	  return "OH NOES!"
	end
end


get '/blue_on' do
	begin
	  Subprocess.check_call(['ruby', 'light.rb', '11', 'on'])
	  return "Success"
	rescue Subprocess::NonZeroExit => e
	  puts e.message
	  puts "Unable to communicate with device"
	  return "OH NOES!"
	end
end
get '/blue_off' do
	begin
	  Subprocess.check_call(['ruby', 'light.rb', '11', 'off'])
	  return "Success"
	rescue Subprocess::NonZeroExit => e
	  puts e.message
	  puts "Unable to communicate with device"
	  return "OH NOES!"
	end
end
