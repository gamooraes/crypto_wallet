class WelcomeController < ApplicationController
  def index
    cookies[:cookie] = "Cookie armazenado no navegador"
    @teste = "Teste"
  end
end
