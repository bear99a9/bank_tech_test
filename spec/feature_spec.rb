describe 'Bank Account Feature Tests' do
  let(:account) { Account.new}
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  it 'displays that I have deposited money into my account' do
    account.deposit(50)
    print = "date || credit || debit || balance\n"\
             "#{date} || 50.00 || 0.00 || 50.00\n"
    expect { account.print_statement }.to output(print).to_stdout
  end

  it 'displays that I have withdrawn money from my account' do
    account.deposit(50)
    print = "date || credit || debit || balance\n"\
             "#{date} || 50.00 || 0.00 || 50.00\n"
    expect { account.print_statement }.to output(print).to_stdout
  end

  it 'shows I need money in my account to withdraw funds' do
    expect { account.withdraw(60) }.to raise_error("Insufficent funds current balance: £#{account.balance}")
  end

  it 'shows a full transaction history' do
    account.deposit(10)
    account.deposit(50)
    account.withdraw(20)
    print = "date || credit || debit || balance\n"\
            "#{date} || 0.00 || 20.00 || 40.00\n"\
            "#{date} || 50.00 || 0.00 || 60.00\n"\
            "#{date} || 10.00 || 0.00 || 10.00\n"
    expect { account.print_statement }.to output(print).to_stdout
  end
end
