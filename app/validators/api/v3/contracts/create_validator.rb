module Api
  module V3
    module Contracts
      class CreateValidator
        include ActiveModel::Model
        attr_accessor :contract_params, :client_params, :client, :contract

        validate :client_name
        validate :client_email
        validate :client_phone
        validate :contract_price
        validate :contract_percent
        validate :contract_address

        private

        def client_name
          return if client_params[:name].present?
          errors.add(:client, 'Client name is blank')
        end

        def client_email
          return if client_params[:email].present?
          errors.add(:client, 'Client email is blank')
        end

        def client_phone
          return if client_params[:phone].present?
          errors.add(:client, 'Client phone is blank')
        end

        def contract_price
          return if contract_params[:price].to_i.positive?
          errors.add(:contract, 'Contract price is invalid')
        end

        def contract_percent
          return if contract_params[:percent].to_i.in?(1..100)
          errors.add(:contract, 'Contract percent is invalid')
        end

        def contract_address
          return if contract_params[:address].present?
          errors.add(:contract, 'Contract address is blank')
        end

        def contract_status
          return if contract_params[:status].in?(%w[new pending])
          errors.add(:contract, 'Contract status is invalid')
        end
      end
    end
  end
end
