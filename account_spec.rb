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

    context "with invalid account number not enough numbers" do
      it "attempts to create and initialize with an account number that is less than 10 digits" do
        expect { Account.new("111111111")}.to raise_error(InvalidAccountNumberError)
      end
    end

    context "with invalid account number" do
      it "attempts to create and initialize with that has non digit characters in it" do
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
        account.acct_number.should =~ /[*]{6}\d{4}/
      end
    end
  end

  describe "deposit!" do

  end

  describe "#withdraw!" do

  end
end
