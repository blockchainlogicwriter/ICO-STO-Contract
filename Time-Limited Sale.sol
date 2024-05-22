uint256 public startTime;
uint256 public endTime;

function setStartTime(uint256 _startTime) external onlyOwner {
    startTime = _startTime;
}

function setEndTime(uint256 _endTime) external onlyOwner {
    endTime = _endTime;
}

modifier onlyWhileOpen() {
    require(block.timestamp >= startTime && block.timestamp <= endTime, "ICO not open");
    _;
}

function buyTokens(uint256 numberOfTokens) external payable onlyWhileOpen {
    // Existing buyTokens implementation
}
