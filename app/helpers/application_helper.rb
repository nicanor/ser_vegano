module ApplicationHelper

  def flash_messages
    flash.collect do |type, message|
      content_tag :div, class: [:alert, "alert-#{type}"] do
        link_to("&times;".html_safe, "", class: :close, data: { dismiss: :alert }) + message
      end
    end.join.html_safe
  end

  def icon(name, html_options = {})
    html_options[:class] = ['fa', "fa-#{name}", html_options[:class]].join(' ')
    content_tag :i, nil, html_options
  end

  def custom_form_for(object, *args, &block)
    options = args.extract_options!
    options[:wrapper] = :bootstrap
    options[:defaults] = {input_html: {class: 'form-control'}}
    simple_form_for(object, *(args << options), &block)
  end

  def span_lock
    content_tag :span, nil, class: 'fa fa-lock', title: t(:protected)
  end
end