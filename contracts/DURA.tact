// File: OwniX_DURA_Staking_AutoReward.tact

contract OwniXDuraStakingAutoReward {

    // ==== Variables ====

    address owner;
    int reward_rate_per_gb;
    int constant initial_reward_rate_per_gb = 10;
    int constant bytes_in_1GB = 1073741824;
    int constant MINING_INTERVAL = 30; // 30 detik cooldown
    int constant HALVING_THRESHOLD = 1000000000 * 1e9; // 1 milyar token

    int totalSupply;
    int constant maxSupply = 8000000000 * 1e9; 
    int minedSupply;
    int ownerReserved;

    map<address, cell> proof_records;
    map<address, int> last_mined_at;

    // For staking
    struct StakeInfo {
        int amount;
        int startTime;
        int lockPeriod; // in seconds
    }

    map<address, StakeInfo> stakes;

    // ==== Constructor ====

    constructor(address _owner) {
        owner = _owner;
        reward_rate_per_gb = initial_reward_rate_per_gb;
        totalSupply = 0;
        minedSupply = 0;
        ownerReserved = (maxSupply * 20) / 100;
    }

    // ==== Proof Submission ====

    external fun submit_proofs(map<address, cell> user_proofs) {
        for (var (user, proof) : user_proofs) {
            require(sender() == user, "Submit your own proof");
            proof_records.set(user, proof);
        }
    }

    // ==== Proof Verification + Mining + Auto-Reward ====

    external fun verify_and_mine(map<address, int> users_data_used_bytes) {
        for (var (user, data_used_bytes) : users_data_used_bytes) {
            require(proof_records.has(user), "Proof missing");

            int last_time = last_mined_at.get(user, 0);
            require(now() - last_time >= MINING_INTERVAL, "Cooldown active");

            cell proof = proof_records.get(user).expect("Proof missing");
            int proofHash = cell_hash(proof);
            require(proofHash != 0, "Invalid proof hash");

            int current_reward_rate = calculate_dynamic_reward_rate();

            int data_used_gb = data_used_bytes / bytes_in_1GB;
            int reward_amount = data_used_gb * current_reward_rate;

            require(minedSupply + reward_amount <= (maxSupply * 80) / 100, "Mining cap reached");

            minedSupply += reward_amount;
            last_mined_at.set(user, now());

            send_jetton_transfer(user, user, reward_amount);
        }
    }

    // ==== Dynamic Mining Rate ====

    internal fun calculate_dynamic_reward_rate() returns (int) {
        int halving_count = minedSupply / HALVING_THRESHOLD;
        int adjusted_reward = initial_reward_rate_per_gb >> halving_count;
        if (adjusted_reward == 0) {
            return 1;
        }
        return adjusted_reward;
    }

    // ==== Auto Jetton Transfer ====

    internal fun send_jetton_transfer(address wallet, address to, int amount) {
        send_raw_message(wallet, build_jetton_transfer(to, amount), 1);
    }

    internal fun build_jetton_transfer(address to, int amount) returns (cell) {
        return begin_cell()
            .store_uint(0xf8a7ea5, 32)
            .store_uint(0, 64)
            .store_address(to)
            .store_address(null)
            .store_coins(amount)
            .store_uint(0, 1)
            .end_cell();
    }

    // ==== Owner Minting ====

    external fun owner_mint(address to, int amount) {
        require(sender() == owner, "Only owner");
        require(totalSupply + amount <= maxSupply, "Max supply exceeded");
        require(amount <= ownerReserved, "Exceeds reserved owner tokens");

        ownerReserved -= amount;
        totalSupply += amount;

        send_jetton_transfer(to, to, amount);
    }

    // ==== Staking ====

    external fun stake(int amount, int lock_period_days) {
        require(lock_period_days >= 90 && lock_period_days <= 365, "Invalid staking period");

        int lock_seconds = lock_period_days * 86400;

        stakes.set(sender(), StakeInfo(
            amount = amount,
            startTime = now(),
            lockPeriod = lock_seconds
        ));

        send_jetton_transfer(address(this), sender(), amount); // Transfer token ke contract staking
    }

    external fun unstake() {
        StakeInfo stake = stakes.get(sender()).expect("No stake found");
        require(now() >= stake.startTime + stake.lockPeriod, "Lock period not finished");

        stakes.delete(sender());
        send_jetton_transfer(sender(), sender(), stake.amount); // Kembalikan token
    }

    // ==== Views ====

    external fun get_total_supply() returns (int) {
        return totalSupply;
    }

    external fun get_mined_supply() returns (int) {
        return minedSupply;
    }

    external fun get_owner_reserved() returns (int) {
        return ownerReserved;
    }

    external fun get_current_reward_rate() returns (int) {
        return calculate_dynamic_reward_rate();
    }

    external fun get_last_mined_at(address user) returns (int) {
        return last_mined_at.get(user, 0);
    }

    external fun get_stake(address user) returns (StakeInfo) {
        return stakes.get(user).expect("No stake info");
    }
}
