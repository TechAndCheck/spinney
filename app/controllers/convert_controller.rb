class ConvertController < ApplicationController
  include ImageGeneration

  def index
    image = convert_image params[:html]
    render json: { "image_data": image }
  end

  def convert_params
    params.requires(:html)
  end
end
