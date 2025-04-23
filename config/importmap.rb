# config/importmap.rb
pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

# Substitua a linha do bootstrap por:
pin "bootstrap" # @5.3.5
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
