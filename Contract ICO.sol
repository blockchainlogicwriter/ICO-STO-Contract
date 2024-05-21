// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract ICO {
    address public owner;
    IERC20 public token;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event TokensSold(address indexed buyer, uint256 amount, uint256 totalPrice);

    constructor(address _tokenAddress, uint256 _tokenPrice) {
        owner = msg.sender;
        token = IERC20(_tokenAddress);
        tokenPrice = _tokenPrice;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function buyTokens(uint256 numberOfTokens) external payable {
        require(msg.value == numberOfTokens * tokenPrice, "Incorrect ETH amount");

        require(token.balanceOf(address(this)) >= numberOfTokens, "Insufficient tokens available");

        require(token.transfer(msg.sender, numberOfTokens), "Token transfer failed");

        tokensSold += numberOfTokens;

        emit TokensSold(msg.sender, numberOfTokens, msg.value);
    }

    function withdrawEther() external onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}
