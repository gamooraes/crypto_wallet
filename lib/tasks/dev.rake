require "tty-spinner"

namespace :dev do
  desc "Configura o ambiente de desenvolviment"
  task setup: :environment do
    if Rails.env.development?
      tasks = [
        { command: "db:drop", start: "Deletando banco de dados...", end: "Deletado com sucesso!" },
        { command: "db:create", start: "Criando o banco de dados...", end: "Criado com sucesso!" },
        { command: "db:migrate", start: "Migrando o banco de dados...", end: "Migrado com sucesso!" },
        { command: "dev:add_mining_types", start: "Cadastrando Tipos de Mineração...", end: "Cadastrados com sucesso!" },
        { command: "dev:add_coins", start: "Cadastrando Moedas...", end: "Cadastradas com sucesso!" }
      ]

      tasks.each do |task|
        show_spinner(task[:start], task[:end]) { system("rails #{task[:command]} > /dev/null ") }
      end
    else
      puts "Você está em ambiente de produção!!! Animal!!!"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    coins = [
      { description: "Bitcoin", acronym: "BTC", url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/1024px-Bitcoin.svg.png", mining_type: MiningType.all.sample },
      { description: "Dash", acronym: "DASH", url_image: "https://thumbs.dreamstime.com/b/vector-logo-dash-coin-icon-symbol-illustration-cryptocurrency-sign-white-background-238988285.jpg", mining_type: MiningType.all.sample },
      { description: "Ethereum", acronym: "ETH", url_image: "https://upload.wikimedia.org/wikipedia/commons/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png", mining_type: MiningType.all.sample },
      { description: "Iota", acronym: "IOT", url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTyhCy5oduCyXBXT9fSkNyQqkJQCizr0hs3g&s", mining_type: MiningType.all.sample },
      { description: "ZCash", acronym: "ZEC", url_image: "https://cryptologos.cc/logos/zcash-zec-logo.png", mining_type: MiningType.all.sample }
    ]

    coins.each do |coin|
      Coin.find_or_create_by!(coin)
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    mining_types = [
      { description: "Proof of Work", acronym: "PoW" },
      { description: "Proof of Stake", acronym: "PoS" },
      { description: "Proof of Capacity", acronym: "PoC" }
    ]

    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
    end
  end

  private

  def show_spinner(msg_begin, msg_end)
    spinner =TTY::Spinner.new("[:spinner] #{msg_begin}", format: :bouncing_ball)
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end
end
