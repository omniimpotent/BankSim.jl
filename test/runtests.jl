using BankSim
using Test

@testset "BankSim.jl" begin
    cust = Customer("abc")
    bank = Bank("xyz")
    @test cust.name == "abc"
    @test cust.cash == 50.0
    @test cust.bankDeposit == 0.0
    
    deposit(cust, bank, 25.0)
    @test cust.bankDeposit == 25.0
end
