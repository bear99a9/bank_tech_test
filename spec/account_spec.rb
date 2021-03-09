describe Account do
  let(:account) { described_class.new }

  it { is_expected.to respond_to :balance }

  context 'Deposit money' do
    it 'the balance updates when you deposit money into the account' do
      account.deposit(100)
      expect(account.balance).to eq(100)
    end
  end

  context 'Withdraw money' do
    it 'the balance updates when you withdraw money into the account' do
      account.deposit(100)
      account.withdraw(50)
      expect(account.balance).to eq(50)
    end
  end
end
