module AppSwagger
  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
      AppSwagger::Root,
      # Controllers
      AppSwagger::Api::V1::ContractsController,
      AppSwagger::Api::V2::ContractsController,
      AppSwagger::Api::V3::ContractsController,
      # Models
      AppSwagger::Models::ErrorModel
  ].freeze
end
