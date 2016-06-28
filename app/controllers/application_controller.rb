class ApplicationController < ActionController::Base
	def index
	end
	def download_pdf
	  send_file(
	    "#{Rails.root}/public/ComputerScienceResume.pdf",
	    filename: "ComputerScienceResume.pdf",
	    type: "application/pdf"
	  )
	end
	def comments
		body = "from:  "
		body << params[:email]
		body << "\r\n\r\n"
		body << params[:comment]
		notifier = Slack::Notifier.new "url"
		notifier.channel = '#channel'
		notifier.username = 'resumebot'
		notifier.ping body
		render json: {success: true}
	end
end
