module Api
  module V1
    class ContractsController < Api::ApplicationController
      def create
        contract = Contract.new(contract_params)

        if contract.save
          render status: 200, json: { message: 'Successfully created' }
        else
          render status: 422, json: { errors: contract.errors.full_messages }
        end
      end

      private

      def contract_params
        params.permit(:address, :price, :percent, :status)
      end
    end
  end
end
