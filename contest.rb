require 'rubygems'
require 'sinatra'
require 'json'

@@domainlist = Hash.new

class Domain
	def initialize (domain_id)
		@id = domain_id
		@former_itemid = "1"
	end
	
	def save itemid
		@former_itemid = itemid
	end
	
	def give_itemid
		@former_itemid
	end
end


get '/*' do
	return "Try POST!"
end

post '/*' do
	std_result = {:msg => "result", :items => [], :version => "1.0"}

	def result msg
		if config = msg["config"]
			team_id = config["team"]["id"]
		end
		if domain_id = msg["domain"]["id"] 
			if not @@domainlist.has_key? domain_id
				logger.info "domain unbekannt"
				@@domainlist[domain_id] = Domain.new(domain_id)
			else
				logger.info "domain bekannt" + domain_id.to_s
			end
		end
		if item_id = msg["item"]["id"]
 			logger.info item_id
			if former_itemid = @@domainlist[domain_id].give_itemid
				@@domainlist[domain_id].save(item_id)
				item_id = former_itemid
			end
		end
		if version = msg["version"]
		end
		
		return {:msg => "result", :items => [{:id => item_id}], :team => {:id => team_id}, :version => version}
		#result = std_result
		logger.info result
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