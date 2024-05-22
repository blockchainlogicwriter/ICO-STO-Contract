uint256 public fundingGoal;
uint256 public deadline;
bool public fundingGoalReached = false;

mapping(address => uint256) public contributions;

function setFundingGoal(uint256 _fundingGoal) external onlyOwner {
    fundingGoal = _fundingGoal;
}

function setDeadline(uint256 _deadline) external onlyOwner {
    deadline = _deadline;
}

function checkGoalReached() external {
    if (address(this).balance >= fundingGoal) {
        fundingGoalReached = true;
    }
}

function refund() external {
    require(block.timestamp > deadline, "ICO not ended");
    require(!fundingGoalReached, "Funding goal reached");

    uint256 amount = contributions[msg.sender];
    contributions[msg.sender] = 0;
    payable(msg.sender).transfer(amount);
}
