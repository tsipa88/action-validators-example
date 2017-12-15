require 'rails_helper'

RSpec.describe Api::V3::Contracts::Create, type: :interactor do
  subject(:result) { Api::V3::Contracts::Create.call(base_params) }
  let(:base_params) { { client_params: client_params, contract_params: contract_params } }
  let(:client_params) { { name: 'John', email: 'jh@doe.com', phone: '434343' } }
  let(:contract_params) { { price: 130, percent: 10, address: 'LA', status: 'new' } }

  it { expect(result.success?).to eq true }

  it 'should successfully create client' do
    expect { result }.to change(Client, :count).by 1
  end

  it 'should successfully create contract' do
    expect { result }.to change(Contract, :count).by 1
  end
end
