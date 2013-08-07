require "rspec"

require_relative "account"

describe Account do
#let(:account_number) {5555555555}
let(:account) { Account.new("5555555555") }

  describe "#initialize" do
    context "with valid input" do
      it "creates and intitializes a new account object, with correct account name" do
        account.acct_number.should eq("******5555")
      end
    end

    context "with invalid account number" do
      it "Raises an InvalidAccountNumberError for account number that is less than 10 digits" do
        expect { Account.new("111111111")}.to raise_error(InvalidAccountNumberError)
      end

      it "Raises an InvalidAccountNumberError for account number that has non digit characters" do
        expect { Account.new("111111111a")}.to raise_error(InvalidAccountNumberError)
      end
    end
  end

  describe "#transactions" do
    context "the transactions array" do
      it "should be an instance of Array class" do
        account.transactions.should be_an_instance_of Array
      end
    end
  end

  describe "#balance" do
    context "test that the transaction array is summed up and valid" do
      it "should be initialized to zero" do
        account.balance.should eq(0)
      end
    end
  end

  describe "#account_number" do
    context "Tests that the account number should be all *'s except for the last four digits" do
      it "should be ******dddd" do
        account.acct_number.should =~ /\*{6}\d{4}/
      end
    end
  end

  describe "deposit!" do
    context "Tests that account is able to deposit funds and the balance reflects the deposit" do
      deposit = 10.00
      it "should add the deposit amount of #{deposit}" do
        account.deposit!(deposit)
        account.balance.should eq(deposit)
      end
    end
  end

  describe "#withdraw!" do
    amount = 10.00
    context "When withdrawing from an account that has non sufficient funds" do
      it "should raise OverdraftError" do
        expect { account.withdraw!(amount) }.to raise_error(OverdraftError)
      end
    end
    context "When a positive balance is present" do
      it "should successfully withdraw specified amount" do
        account.deposit!(50)
        expect {account.withdraw!(amount)}.to change{account.balance}.by(-10)
      end
    end
  end
end
