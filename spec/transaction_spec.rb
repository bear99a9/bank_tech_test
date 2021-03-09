# frozen_string_literal: true

describe Transaction do
  let(:transaction) { described_class.new('12/01/2021', 50, 0, 50) }

  it 'initialises a transaction when called' do
    expect(transaction).to be_an_instance_of(Transaction)
    expect(transaction.date).to eq('12/01/2021')
    expect(transaction.balance).to eq(50)
  end
end
