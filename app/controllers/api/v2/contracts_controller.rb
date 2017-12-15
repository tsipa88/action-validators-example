module Api
  module V2
    class ContractsController < Api::ApplicationController
      def create
        result = Contracts::Create.call(base_params)

        if result.success?
          render status: 200, json: { message: 'Successfully created' }
        else  
          render status: 422, json: { errors: result.error } 
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
