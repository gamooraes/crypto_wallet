module ApplicationHelper
  def translate_text(text)
    t("texts.#{text}")
  end

  def translated_navigation_links(link)
    t("links.#{link}")
  end

  def translated_model_name(model_class)
    model_class.model_name.human
  end
end
