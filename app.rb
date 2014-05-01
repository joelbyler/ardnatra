require 'sinatra'
require 'subprocess'

get '/' do
  File.read(File.join('public', 'index.html'))
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

def brightness
  Subprocess.check_output(['ruby', 'sensor.rb', 'A0'])
end

def temperature
  Subprocess.check_output(['ruby', 'sensor.rb', 'A1'])
end

get '/stats' do
	content_type 'application/json'
	"{ \"brightness\": #{brightness}, \"temp\": #{temperature} }"
end
