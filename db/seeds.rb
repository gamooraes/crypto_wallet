# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
coins = [
  { description: "Bitcoin", acronym: "BTC", url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/1024px-Bitcoin.svg.png" },
  { description: "Dash", acronym: "DASH", url_image: "https://thumbs.dreamstime.com/b/vector-logo-dash-coin-icon-symbol-illustration-cryptocurrency-sign-white-background-238988285.jpg" },
  { description: "Ethereum", acronym: "ETH", url_image: "https://upload.wikimedia.org/wikipedia/commons/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png" },
  { description: "Iota", acronym: "IOT", url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTyhCy5oduCyXBXT9fSkNyQqkJQCizr0hs3g&s" },
  { description: "ZCash", acronym: "ZEC", url_image: "https://cryptologos.cc/logos/zcash-zec-logo.png" }
]


coins.each do |coin|
  Coin.find_or_create_by!(coin)
end

mining_types = [
  { name: "Proof of Work", acronym: "PoW" },
  { name: "Proof of Stake", acronym: "PoS" },
  { name: "Proof of Capacity", acronym: "PoC" }
]

mining_types.each do |mining_type|
  Coin.find_or_create_by!(mining_type)
end
