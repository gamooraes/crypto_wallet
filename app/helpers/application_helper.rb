module ApplicationHelper
  def translate_text(text)
    t("texts.#{text}")
  end

  def translated_navigation_links(link)
    t("links.#{link}")
  end
end
