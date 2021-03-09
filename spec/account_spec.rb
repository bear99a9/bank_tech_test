describe Account do
  let(:account) { described_class.new }

  it { is_expected.to respond_to :balance }

  context 'Deposit money' do
    it 'Updates the balance when you deposit money into the account' do
      account.deposit(100)
      expect(account.balance).to eq(100)
    end
  end

  context 'Withdraw money' do
    it 'Updates the balance when you withdraw money into the account' do
      account.deposit(100)
      account.withdraw(50)
      expect(account.balance).to eq(50)
    end

    it "Raises an error of 'Insufficent funds' if the account has below the withdrawal amount" do
      expect{ account.withdraw(50) }.to raise_error('Insufficent funds')
    end
  end

  context 'Transactions' do
    it 'creates a transaction when you deposit money' do
      account.deposit(100)
      expect(account.transactions.count).to be(1)
      expect(account.transactions[0]).to be_an_instance_of(Transaction)
    end
  end
end
