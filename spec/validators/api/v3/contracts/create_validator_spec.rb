require 'rails_helper'

RSpec.describe Api::V3::Contracts::CreateValidator do
  subject(:validator) { Api::V3::Contracts::CreateValidator.new(base_params) }
  let(:base_params) { { client_params: client_params, contract_params: contract_params } }

  context 'when params are valid' do
    let(:client_params) { { name: 'John', email: 'jh@doe.com', phone: '434343' } }
    let(:contract_params) { { price: 130, percent: 10, address: 'LA', status: 'new' } }

    it 'does not raise errors' do
      expect(validator.valid?).to eq true
      expect(validator.errors).to be_empty
    end
  end

  context 'when client params are invalid' do
    let(:client_params) { { name: nil, email: '', phone: nil } }
    let(:contract_params) { { price: 130, percent: 10, address: 'LA', status: 'new' } }
    let(:expected_errors) do
      ['Client name is blank', 'Client email is blank', 'Client phone is blank']
    end  

    it 'raise client errors' do
      expect(validator.valid?).to eq false
      expect(validator.errors[:client]).to match_array(expected_errors)
    end
  end

  context 'when contract params are invalid' do
    let(:client_params) { { name: 'John', email: 'jh@doe.com', phone: '434343' } }
    let(:contract_params) { { price: -1, percent: 120, address: 'LA', status: 'new' } }
    let(:expected_errors) do
      ['Contract percent is invalid', 'Contract price is invalid']
    end  

    it 'raise client errors' do
      expect(validator.valid?).to eq false
      expect(validator.errors[:contract]).to match_array(expected_errors)
    end
  end
end
