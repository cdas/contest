require 'rubygems'
require 'sinatra'
require 'json'

post "/" do
	msg = JSON.parse(request.body.read)
	puts msg.to_s

	if msg.has_key? 'error' 
		return
	elsif msg.has_key? 'msg'
		if msg["msg"] == "impression"
			# team_id = msg[:config][:team]
			# if msg[:item][:id]
				# item_id = msg[:item][:id]
			# end
			# if msg[:version]
				# version = msg[:version]
			# end
			#result = {:msg => "result", :items => [{:id => item_id}], :team => {:id => team_id}, :version => version}
			result = {:msg => "result"}
			return result.to_json
		elsif msg["msg"] == "feedback"
			return result.to_json
		elsif msg["msg"] == "result"
			return result.to_json
		end
	end
end
