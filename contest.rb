require 'rubygems'
require 'sinatra'
require 'json'

class Message < Hash
	def initialize data
		if data.is_a? Hash 
			data.each do |key, value|
				self[key] = value
			end	
		else
			self["msg"] = "Error: Wrong data input"
		end
	end
end

def respond_on msg
	if not msg["msg"] == "error"
		return std_result = {:msg => "result", :items => [], :version => "1.1"}
		# return {:msg => "result", :items => [{:id => item_id}], :team => {:id => team_id}, :version => version}
		# tba
	else
		return std_result = {:msg => "result", :items => [], :version => "1.0"}
	end
end

get '/*' do
	return "Try POST!"
end

post '/*' do
	msg = Message.new (JSON.parse(request.body.read))
	File.open("message_log.txt", 'a') do |f| 
		f.write(msg.to_s)
	end
	return (respond_on msg).to_json
end