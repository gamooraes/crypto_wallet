module CoinsHelper
  def translated_coin_attribute(attribute)
    Coin.human_attribute_name(attribute)
    # ou, se preferir o I18n diretamente:
    # t("activerecord.attributes.coin.#{attribute}")
  end

  def coin_model_name
    Coin.model_name.human
  end
end
