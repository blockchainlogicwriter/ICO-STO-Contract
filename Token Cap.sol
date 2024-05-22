uint256 public tokenCap;

function setTokenCap(uint256 _tokenCap) external onlyOwner {
    tokenCap = _tokenCap;
}

function buyTokens(uint256 numberOfTokens) external payable {
    require(tokensSold + numberOfTokens <= tokenCap, "Token cap reached");

    // Existing buyTokens implementation
}
