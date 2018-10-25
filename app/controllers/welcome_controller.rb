class WelcomeController < ApplicationController
  def index

  	@exemplo = "Variável de instancia/sessão - liga controller a view."
  	@meunome = params[:nome]

  end
end
