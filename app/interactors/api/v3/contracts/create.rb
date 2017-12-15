module Api
  module V3
    module Contracts
      class Create
        include Interactor
        
        delegate :client, :contract, :client_params, :contract_params, to: :context

        def call
          ActiveRecord::Base.transaction do
            process_client
            process_contract
          end
        end

        protected

        def process_client
          client = Client.new(client_params)
          client.save
        end

        def process_contract
          contract = Contract.new(contract_params)
          contract.client = client
          contract.save
        end
      end
    end  
  end
end
