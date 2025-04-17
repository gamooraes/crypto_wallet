module WelcomeHelper
  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end

  def ambiente
    if Rails.env.development?
      "Desenvolvimento"
    elsif Rails.env.production?
      "Produção"
    else
      "Teste"
    end
  end

  def locale
    I18n.locale == :en ? "Ingês" : "PT-BR"
  end
end
