require 'spec_helper'

describe "Contest App" do
	
	it "should respond a result on POST" do
		data = {:msg => "impression",:id => 1,:client => {:id => 12},:domain => {:id => 31},:item => {:id => "50",:title =>"Item Title",:url =>"http://www.plista.com",:created => 20130423,:text => "item_text:string",:img => "http://item_img_url:string",:recommendable => true},:context => {:category => {:id => 99}},:config => {:team => {:id => 31},:timeout => 20.2 ,:recommend => true,:limit => 30},:version => "version_string:string >"}.to_json
		result = {
					:msg => "result",
					:items => [
						{:id => 11},
						{:id => 21}
					],
					:team => {
						:id => 31
					},
					:version => "test"
				}.to_json
		post "/" , data
		#last_response.body.should match	result
	end
end