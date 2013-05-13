require 'json'

input = '{
"msg":"impression",
"id":1,
"client":{
	"id":1
},
"domain":{
	"id":1
},
"item":{
	"id":"3",
	"title":"Titel",
	"url":"http://",
	"created":130101,
	"text":"Bodytext",
	"img":"htpp bild",
	"recommendable":1
},
"context":{
	"category":{
		"id":1
	}
},
"config":{
	"team":{
		"id":1
	},
	"timeout":1,
	"recommend":1,
	"limit":100
},
"version":1
}'
msg = JSON.parse(input)
if msg == nil
	puts "no data"
else 
	print msg
end
