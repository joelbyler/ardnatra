require 'sinatra'
require 'subprocess'

get '/' do
  File.read(File.join('public', 'index.html'))
end

get '/hi' do
  "Hello World!"
end

get '/green' do
	begin
	  Subprocess.check_call(['ruby', 'light.rb', '12', 'on'])
	  return "Success"
	rescue Subprocess::NonZeroExit => e
	  puts e.message
	  puts "Unable to communicate with device"
	  return "OH NOES!"
	end
end


get '/blue' do
	begin
	  Subprocess.check_call(['ruby', 'light.rb', '11', 'on'])
	  return "Success"
	rescue Subprocess::NonZeroExit => e
	  puts e.message
	  puts "Unable to communicate with device"
	  return "OH NOES!"
	end
end

get '/brightness' do
	begin
	  # brightness = Subprocess.check_output(['ruby', 'sensor.rb', '13'])
	  # return "Success " + brightness
	  Subprocess.check_call(['ruby', 'sensor.rb', '13'])
	  return "Success"
	rescue Subprocess::NonZeroExit => e
	  puts e.message
	  puts "Unable to communicate with device"
	  return "OH NOES!"
	end
end
get '/stats' do
	content_type 'application/json'
	"{ \"brightness\": #{[1,2,3,4].sample}, \"temp\": #{[10,20,30,40].sample} }"
end
