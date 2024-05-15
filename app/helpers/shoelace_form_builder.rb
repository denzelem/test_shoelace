class ShoelaceFormBuilder < ActionView::Helpers::FormBuilder

  # Poor man fix to change the tag names
  # TODO: Does not select the current option yet
  def collection_select(*)
    document = Nokogiri::HTML::DocumentFragment.parse(super)
    document.css('select').each { |tag| tag.name = 'sl-select' }
    document.css('option').each { |tag| tag.name = 'sl-option' }
    document.to_s.html_safe # XSS: super is already HTML safe
  end
end
