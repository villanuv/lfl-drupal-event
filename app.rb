require 'rubygems'
require 'sinatra'
require 'bundler/setup'

get '/' do
	erb :index
end

post '/' do
	text = params[:zoomtext]
	codeExp = /(?<=Passcode: ).*?(?=$)/
	urlExp  = /.+?pwd=.+/
	mtgExp  = /(?<=Meeting ID: ).*?(?=$)/

	code = text.match(codeExp)[0].chomp
	url  = text.match(urlExp)[0].chomp
	mtg  = text.match(mtgExp)[0].chomp

	@message = "*** HOW TO JOIN VIRTUAL EVENT *** A few minutes before the event start time, you can join the event online or by phone *** *** *** To join ONLINE, go to #{url} *** *** *** OR Launch the Zoom app and enter Meeting ID: #{mtg} and Passcode: #{code} *** *** *** To join by PHONE from a Chicago location, call +1 312 626 6799 and enter Meeting ID: #{mtg} *** *** *** If you have issues joining, tips and help are available at https://www.lakeforestlibrary.org/join *** *** *** *** *** THIS MESSAGE IS SENT FROM AN UNATTENDED MAILBOX. PLEASE DO NOT HIT REPLY. If you have questions or need to contact us about your event registration, please email reference@lakeforestlibrary.org."

	erb :text
end