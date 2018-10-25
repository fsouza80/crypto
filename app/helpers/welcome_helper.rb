module WelcomeHelper

	def ambiente_rails
		if Rails.env.development?
			"desenvolvimento"
		elsif Rails.env.production?
			"produção"
		else
			"Teste"
		end
	end

end
