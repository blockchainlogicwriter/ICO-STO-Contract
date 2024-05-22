mapping(address => bool) public kycCompleted;

function completeKYC(address _address) external onlyOwner {
    kycCompleted[_address] = true;
}

modifier onlyKYCCompleted() {
    require(kycCompleted[msg.sender], "KYC not completed");
    _;
}

function buyTokens(uint256 numberOfTokens) external payable onlyKYCCompleted {
    // Existing buyTokens implementation
}
