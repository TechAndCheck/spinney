module ImageGeneration
  extend ActiveSupport::Concern

  def convert_image(html)
    image = generate_image html
    Base64.encode64(image)
  end

  def generate_image(html)
    rendered_summary_image = Grover.new(html)
    rendered_summary_image.to_jpeg
  end
end
