namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
  	if Rails.env.development?
  		
      show_spinner("Apagando BD...") do
  			%x(rails db:drop) # %x() = executa comandos dentro do IRB no terminal
  		end
  		
      show_spinner("Criando BD...") do
  			%x(rails db:create) # %x() = executa comandos dentro do IRB no terminal
  		end
  		
      show_spinner("Migrando BD...") { %x(rails db:migrate) } # quando bloco tiver 1 linha, usa entre chaves 
  		
      %x(rails dev:savecoins) 
      %x(rails dev:saveminingtypes)
    
    end
  end

  desc "Cadastrando moedas"
  task savecoins: :environment do
  
    spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas")
    spinner.auto_spin
   
    coins= [  
          { description: "Bitcon", 
            acronym: "BTC", 
            url_image: "http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png" 
          },
        
          { description: "Dash", 
            acronym: "DAS", 
            url_image: "data:image/png;base64,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" 
          },
        
          { description: "Etherium", 
            acronym: "ETH", 
            url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJG8SdDaKvOg0gVrCdg7vSwKE5fblraYeEE_Q-gKn2ccymrZPX" 
          }

        ]

    coins.each do |coin|
      Coin.find_or_create_by!(coin) #metodo que procura no BD e se encontrar o registro ele não cria, evitando duplicacoes.
    end

    spinner.success("Concluído!")

  end
  
  desc "Cadastrando tipos de mineração"
  task saveminingtypes: :environment do
  
    spinner = TTY::Spinner.new("[:spinner] Cadastrando tipos de mineração")
    spinner.auto_spin
   
    miningtypes= [  
          { description: "Proof of Work", 
            acronym: "PoW", 
          },
        
          { description: "Proof of Stake", 
            acronym: "PoS", 
          },
        
          { description: "Proof of Capacity", 
            acronym: "PoC", 
          }

        ]

    miningtypes.each do |mining|
      MiningType.find_or_create_by!(mining) #metodo que procura no BD e se encontrar o registro ele não cria, evitando duplicacoes.
    end

    spinner.success("Concluído!")

  end
  
  private
  def show_spinner (msg_start)
  	spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
  	spinner.auto_spin
  	yield # BLOCO DE CÒDIGOS - OQUE ESTIVER DENTRO DE DO ... END
  	spinner.success("Concluído!")
  end
end
