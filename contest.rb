require 'rubygems'
require 'sinatra'
require 'json'

post "/" do
	msg = JSON.parse(request.body.read)


	if msg.has_key? 'error' 
		return
	elsif msg.has_key? 'msg'
		if msg["msg"] == "impression"
#			team_id = msg[:config][:team]
			item_id = msg[:item][:id]
			version = msg[:version]
			result = {:msg => "result", :items => [{:id => item_id}], :team => {:id => team_id}, :version => version}
			return result.to_json
		elsif msg["msg"] == "feedback"
			return result.to_json
		elsif msg["msg"] == "result"
			return result.to_json
		end
	end
end
