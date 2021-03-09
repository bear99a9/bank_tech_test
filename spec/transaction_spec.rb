# frozen_string_literal: true

describe Transaction do
  it 'initialises a transaction when called' do
    transaction = described_class.new('12/01/2021', 50, 0, 50)
    expect(transaction).to be_an_instance_of(Transaction)
  end
end
