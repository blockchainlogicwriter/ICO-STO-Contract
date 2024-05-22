mapping(address => bool) public whitelistedAddresses;

function addToWhitelist(address _address) external onlyOwner {
    whitelistedAddresses[_address] = true;
}

function removeFromWhitelist(address _address) external onlyOwner {
    whitelistedAddresses[_address] = false;
}

modifier onlyWhitelisted() {
    require(whitelistedAddresses[msg.sender], "Not whitelisted");
    _;
}

function buyTokens(uint256 numberOfTokens) external payable onlyWhitelisted {
    // Existing buyTokens implementation
}
