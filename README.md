# lita-example

Handler: demo
	/ping
	PONG

	Lita is available for chat.

	http://localhost:8080/hello/1
	wishes for user with id: '1'

Handler: demo_chat
	hi
	Hello!

Handler: demo_config
	gitinfo yesuagg
	user info

Handler: demo_event
	Welcome User!

Handler: demo_http
	http://localhost:8080/hello/dummy,text/world
	dummy,text

Handler: demo_redis
	/save yesuagg YesuAggarwal
	saved!

	/fetch yesuagg
	YesuAggarwal

Handler: demo_template
	/wish
	Hello, Carl!

	/reverse
	Pug, Carl

Handler: demo_timer
	after_timer
	Hello, 1 seconds later!

	every_timer
	This is your 1 second reminder!
	This is your 1 second reminder!
	This is your 1 second reminder!
	