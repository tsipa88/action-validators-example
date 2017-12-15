module Api
  module V3
    class ContractsController < Api::ApplicationController
      def create
        validator = Contracts::CreateValidator.new(base_params)

        if validator.valid?
          result = Contracts::Create.call(base_params)
          render status: 200, json: { message: 'Successfully created' }
        else
          render status: 422, json: { errors: validator.errors }  
        end
      end

      private

      def contract_params
        params.permit(:address, :price, :percent, :status)
      end

      def client_params
        params.permit(:email, :phone, :name)
      end

      def base_params
        { contract_params: contract_params, client_params: client_params }
      end
    end
  end
end
