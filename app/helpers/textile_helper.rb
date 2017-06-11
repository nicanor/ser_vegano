module TextileHelper

  def compile_textile(raw_text)
    textilize(compile_images(raw_text)).html_safe
  end

  # [img:my_image:'100x100'] = image_tag(image.file.thumb('100x100').url, class: :thumbnail)
  def compile_images(content)
    content.gsub(/\[img:(.*):'(.*)'\]/) { get_image($1, $2) }
  end

  def get_image(slug, size)
    image_tag(Image.friendly.find(slug).file.thumb(size).url, class: 'img-responsive')
  rescue ActiveRecord::RecordNotFound
    '<!-- ActiveRecord::RecordNotFound -->'
  rescue NoMethodError
    '<!-- NoMethodError -->'
  end

end