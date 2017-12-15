module Api
  class DocsController < ApplicationController
    def index
      render json: Swagger::Blocks.build_root_json(::AppSwagger::SWAGGERED_CLASSES)
    end
  end
end