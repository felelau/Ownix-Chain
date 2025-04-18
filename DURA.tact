// DURA - Data Usage Reward Algorithm on TON (Secure Hash-Based Version)
// Written in Tact Language

contract DURA {

    // Mapping: user address => total rewarded tokens
    map<address, int> public rewards;

    // Admin (e.g., validator or contract deployer)
    address admin;

    // Mapping to prevent replay of submitted hashes (hash => used)
    map<cell, bool> public usedHashes;

    // Initialization with admin address
    constructor(address _admin) {
        admin = _admin;
    }

    // Validator submits reward on behalf of user using verified hashed proof
    receive("submit_reward") {
        // Only admin/validator allowed to submit
        require(msg.sender == admin, "Unauthorized: Only validator can submit rewards");

        // Decode submitted cell:
        // Contains: user address, reward amount, hashId
        slice body = msg.body.slice();
        address user = body~load_msg_address();
        int rewardAmount = body~load_int(32); // Example: 32-bit reward amount
        cell hashId = body~load_ref();

        // Prevent double-spend or replay attack
        require(!usedHashes[hashId], "Hash already used");

        // Mark hash as used
        usedHashes[hashId] = true;

        // Update reward
        rewards[user] += rewardAmount;

        // Emit event
        emit("reward_granted", user, rewardAmount);
    }

    // Query reward
    get("get_reward") {
        address user = msg.sender;
        return rewards[user];
    }

    // Admin-only: reset a user's reward (if needed)
    receive("reset_reward") {
        require(msg.sender == admin, "Only admin can reset");
        address target = decode_address(msg.body);
        rewards[target] = 0;
        emit("reward_reset", target);
    }
} 

/*
🛡️ Keamanan & Validasi (Off-chain):
- Perangkat pengguna mengenkripsi dan hash data usage (ex: 100MB).
- Validator memverifikasi hash dan data asal secara off-chain.
- Validator mengirim hash ID + reward yang sah ke smart contract.
- Kontrak hanya mencatat reward jika hash belum pernah digunakan.
*/

