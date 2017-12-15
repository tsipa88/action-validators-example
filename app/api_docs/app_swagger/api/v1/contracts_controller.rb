module AppSwagger
  module Api
    module V1
      class ContractsController
        include Swagger::Blocks

        swagger_path '/api/v1/contracts' do
          operation :post do
            key :description, <<-TEXT
              Create Contract using basic ActiveRecord validations.
            TEXT
            key :operationId, 'createContract'
            key :produces, ['application/json']
            key :tags, ['Contracts']

            parameter name: :price,   in: :formData, required: false, type: :integer
            parameter name: :percent, in: :formData, required: false, type: :integer
            parameter name: :address, in: :formData, required: false, type: :string
            parameter name: :status,  in: :formData, required: false, type: :string

            response 200 do
              key :description, 'Returns 200'
              
              schema do
                property :success do
                  key :type, :boolean
                end
              end
            end

            response 422 do
              key :description, 'Unprocessable entity.'

              schema do
                key :'$ref', '#/definitions/ErrorModel'
              end
            end
          end
        end
      end
    end
  end
end
