struct PricingTier {
    uint256 amount;
    uint256 price;
}

PricingTier[] public pricingTiers;

function addPricingTier(uint256 amount, uint256 price) external onlyOwner {
    pricingTiers.push(PricingTier(amount, price));
}

function getCurrentPrice() public view returns (uint256) {
    for (uint256 i = 0; i < pricingTiers.length; i++) {
        if (tokensSold < pricingTiers[i].amount) {
            return pricingTiers[i].price;
        }
    }
    return pricingTiers[pricingTiers.length - 1].price;
}

function buyTokens(uint256 numberOfTokens) external payable {
    uint256 currentPrice = getCurrentPrice();
    require(msg.value == numberOfTokens * currentPrice, "Incorrect ETH amount");

    // Existing buyTokens implementation
}
