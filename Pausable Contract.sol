bool public paused = false;

modifier whenNotPaused() {
    require(!paused, "Contract is paused");
    _;
}

function pause() external onlyOwner {
    paused = true;
}

function unpause() external onlyOwner {
    paused = false;
}

function buyTokens(uint256 numberOfTokens) external payable whenNotPaused {
    // Existing buyTokens implementation
}
