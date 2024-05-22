# ICO-Contract
This README provides an overview and instructions for the ICO (Initial Coin Offering) contract written in Solidity. The ICO contract facilitates the sale of ERC20 tokens in exchange for Ether (ETH).

Contract Overview
The ICO contract allows the contract owner to sell a specified ERC20 token at a fixed price per token. Investors can purchase tokens by sending Ether to the contract.

Contract Features
Token Sale: Investors can buy tokens by sending Ether to the contract.
Token Price: The contract owner sets a fixed price for the tokens.
Tokens Sold: The contract keeps track of the total number of tokens sold.
Ether Withdrawal: The contract owner can withdraw the Ether collected from the token sale.
Contract Variables
owner: The address of the contract owner.
token: The ERC20 token being sold.
tokenPrice: The price of each token in Wei (1 Ether = 10^18 Wei).
tokensSold: The total number of tokens sold.
Events
TokensSold(address indexed buyer, uint256 amount, uint256 totalPrice): Emitted when tokens are sold.
Functions
Constructor

Initializes the contract with the ERC20 token address and token price.
constructor(address _tokenAddress, uint256 _tokenPrice)
buyTokens

Allows investors to buy tokens by sending Ether to the contract.
function buyTokens(uint256 numberOfTokens) external payable
withdrawEther

Allows the contract owner to withdraw the Ether collected from the token sale.
function withdrawEther() external onlyOwner
Usage Instructions
1. Deploy the Contract
Deploy the contract with the following parameters:
_tokenAddress: The address of the ERC20 token contract.
_tokenPrice: The price of each token in Wei.
2. Buy Tokens
Call the buyTokens function with the number of tokens you want to buy.
Send Ether along with the transaction. The amount of Ether should be equal to numberOfTokens * tokenPrice.
3. Withdraw Ether
Only the contract owner can call the withdrawEther function to withdraw the collected Ether.
Example
Deploying the Contract
Constructor Parameters:
_tokenAddress: 0xYourTokenContractAddress
_tokenPrice: 1000000000000000 (0.001 ETH per token)
Buying Tokens
Call buyTokens(10) to buy 10 tokens.
Send 0.01 ETH with the transaction if the token price is 0.001 ETH per token.
Withdrawing Ether
The contract owner calls withdrawEther() to withdraw the collected Ether.
Security Considerations
Ensure that the ERC20 token contract is thoroughly audited and secure.
Perform security audits on the ICO contract.
Consider implementing additional features like token vesting, whitelisting, or KYC/AML checks based on your project requirements and regulatory compliance needs.
