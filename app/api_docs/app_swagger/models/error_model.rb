module AppSwagger
  module Models
    class ErrorModel
      include Swagger::Blocks

      swagger_schema :ErrorModel do
        property :success do
          key :type, :boolean
        end

        property :alert do
          key :type, :string
        end
      end
    end
  end
end