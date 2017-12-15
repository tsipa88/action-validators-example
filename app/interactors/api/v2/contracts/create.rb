module Api
  module V2
    module Contracts
      class Create
        include Interactor
        
        delegate :contract_params, :client_params, :optional_params, 
                 :client, :contract, to: :context

        def call
          ActiveRecord::Base.transaction do
            process_client
            process_contract
          end  
        end

        protected

        def process_client
          client = Client.new(client_params)
          
          return if client.save
          context.fail!(error: client.errors.full_messages)
        end

        def process_contract
          contract = Contract.new(contract_params)
          contract.client = client

          return if contract.save
          context.fail!(error: contract.errors.full_messages)
        end
      end
    end  
  end
end
