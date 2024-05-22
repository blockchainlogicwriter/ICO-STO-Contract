struct VestingSchedule {
    uint256 start;
    uint256 duration;
    uint256 amount;
}

mapping(address => VestingSchedule) public vestingSchedules;

function createVestingSchedule(address beneficiary, uint256 amount, uint256 start, uint256 duration) external onlyOwner {
    vestingSchedules[beneficiary] = VestingSchedule(start, duration, amount);
}

function releaseTokens() external {
    VestingSchedule storage schedule = vestingSchedules[msg.sender];
    require(block.timestamp >= schedule.start + schedule.duration, "Vesting period not completed");
    uint256 amount = schedule.amount;
    schedule.amount = 0; // Prevent reentrancy
    require(token.transfer(msg.sender, amount), "Token transfer failed");
}
