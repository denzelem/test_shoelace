module ApplicationHelper
  def shoelace_form_for(record, options = {}, &block)
    options[:builder] = ShoelaceFormBuilder
    form_for(record, options, &block)
  end
end
