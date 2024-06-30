module BankSim

export Bank, Customer, defaultBank, defaultCustomer, deposit, withdraw
mutable struct Bank
    name::String
    cash::Float64
    totalCredit::Float64
    totalDeposit::Float64
    equity::Float64

    Bank(name) = new(name, 1000.0, 10.0, 10.0, 1000.0)
end

function defaultBank(bank::Bank)
    bank.name = "DEFAULT-"*bank.name
    bank.cash = 0
    bank.totalCredit = 0
    bank.totalDeposit = 0
    bank.equity = 0
end

mutable struct Customer
    name::String
    cash::Float64
    bankDeposit::Float64

    Customer(name) = new(name, 50.0, 0.0)
end

function defaultCustomer(customer::Customer)
    customer.name = "DEFAULT-"*customer.name
    customer.cash = 0
    customer.bankDeposit = 0
end

function deposit(cust::Customer, bank::Bank, amount::Float64)
    if cust.cash ≥ amount
        cust.cash -= amount
        cust.bankDeposit += amount
        bank.cash += amount
        bank.totalDeposit += amount
    else
        println("Not enough cash to deposit the amount!")
    end
end

function withdraw(cust::Customer, bank::Bank, amount::Float64)
    if bank.cash ≥ amount
        if cust.bankDeposit ≥ amount
            bank.cash -= amount
            bank.totalDeposit -= amount
            cust.cash += amount
            cust.bankDeposit -= amount
        else
            println("You don't have that amount in your deposit account!")
        end
    else
        println("Not enough cash in our vaults. Sorry!")
    end
end

end
