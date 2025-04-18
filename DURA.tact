
contract DURA {
    var owner: address;
    var reward_rate_per_gb: int; // contoh 10 OWNIX per GB
    var proof_records: map(address, bytes); // Simpan proof hash
    var reward_balances: map(address, int); // Simpan saldo reward

    // Constructor
    constructor(owner: address, reward_rate_per_gb: int) {
        self.owner = owner;
        self.reward_rate_per_gb = reward_rate_per_gb;
    }

    // Kirim proof
    external fun submit_proof(user: address, proof_hash: bytes) {
        proof_records[user] = proof_hash;
    }

    // Verifikasi + reward
    external fun verify_and_reward(user: address, data_used_bytes: int) {
        // Validasi hash (basic)
        require(proof_records.exists(user), "No proof submitted");

        let bytes_in_1GB = 1073741824;
        let data_used_gb = data_used_bytes / bytes_in_1GB;
        let reward = data_used_gb * self.reward_rate_per_gb;
        
        reward_balances[user] += reward;
    }

    // Distribute reward
    external fun distribute_reward(user: address) {
        let reward = reward_balances[user];
        require(reward > 0, "No reward to distribute");

        // Transfer jetton OWNIX (nanti tinggal panggil Minter)
        send_jetton(user, reward);

        // Reset saldo setelah distribusi
        reward_balances[user] = 0;
    }

    // Internal: Send jetton OWNIX
    internal fun send_jetton(to: address, amount: int) {
        // Panggil ownix_jetton_minter transfer method
    }
}
