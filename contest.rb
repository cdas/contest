require 'rubygems'
require 'sinatra'
require 'json'

@@former_item = 1

get '/*' do
	return "Try POST!"
end

post '/*' do
	std_result = {:msg => "result", :items => [], :version => "1.0"}

	def result msg
		if config = msg["config"]
			team_id = config["team"]
		end
		if item = msg["item"]
			logger.info item
			item_id = @@former_item 
			@@former_item = item["id"]
		end
		if version = msg["version"]
		end
		result = {:msg => "result", :items => [{:id => item_id}], :team => {:id => team_id}, :version => version}
		#result = std_result
	end

	logger.info "Request received"
	msg = JSON.parse(request.env["rack.input"].read)
	logger.info "Parsed JSON Data "
	if msg["msg"] == "impression"
		logger.info "impression received"
		result(msg).to_json
	elsif
		std_result
	end 
	# further processing...
end