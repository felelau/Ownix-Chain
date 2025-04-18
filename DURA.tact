
// DURA - Data Usage Reward Algorithm on TON
// Written in Tact Language

contract DURA {

    // Storage: mapping of address => total rewarded tokens
    map<address, int> public rewards;

    // Admin address (e.g., deployer or validator)
    address admin;

    // Initialization
    constructor(address _admin) {
        admin = _admin;
    }

    // Receive encrypted data usage and reward user accordingly
    receive("submit_data") {
        address user = msg.sender;
        int dataAmount = decode_int(msg.body); // total data in MB encrypted off-chain and decoded before sending

        require(dataAmount > 0, "Invalid data amount");

        // Calculate reward (1 OWNIX = 100MB, example ratio)
        int rewardAmount = dataAmount / 100;

        // Update user reward storage
        rewards[user] += rewardAmount;

        // Emit event (for tracking)
        emit("reward_granted", user, rewardAmount);
    }

    // Allow user to query their reward
    get("get_reward") {
        address user = msg.sender;
        return rewards[user];
    }

    // Admin can reset reward (for testing or new cycle)
    receive("reset_reward") {
        require(msg.sender == admin, "Only admin can reset");
        address target = decode_address(msg.body);
        rewards[target] = 0;
        emit("reward_reset", target);
    }
}
