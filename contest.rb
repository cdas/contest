require 'rubygems'
require 'sinatra'
require 'json'

def result msg
	if msg.has_key? 'error' 
		return
	elsif msg.has_key? 'msg'
		if msg["msg"] == "impression"
			if msg[:config]
				team_id = msg[:config][:team]
			end
			if item = msg[:item]
				item_id = item[:id]
			end
			if msg[:version]
				version = msg[:version]
			end
			# result = {:msg => "result", :items => [{:id => item_id}], :team => {:id => team_id}, :version => version}
			result = {:msg => "result", :items => [], :version => "1.0"}
			# result = {:msg => "result"}
			return result.to_json
		elsif msg["msg"] == "feedback"
			return result.to_json
		elsif msg["msg"] == "result"
			return result.to_json
		end
	end
end

post "/" do
	logger.info "loading data"
	
	result(JSON.parse(request.body.read))
end