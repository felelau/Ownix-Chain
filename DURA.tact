// File: DURA.tact

contract DURA {
    // Address pemilik contract (admin)
    address owner;

    // Reward per 1 GB data usage (contoh 10 OWNIX)
    int reward_rate_per_gb;

    // Mapping penyimpanan proof hash per user
    map<address, cell> proof_records;

    // Mapping saldo reward per user
    map<address, int> reward_balances;

    // Constructor, dipanggil saat deploy
    constructor(address _owner, int _reward_rate_per_gb) {
        owner = _owner;
        reward_rate_per_gb = _reward_rate_per_gb;
    }

    // Fungsi submit proof hash
    external fun submit_proof(address user, cell proof_hash) {
        require(sender() == user, "Only user can submit own proof");
        proof_records.set(user, proof_hash);
    }

    // Fungsi verifikasi proof dan hitung reward
    external fun verify_and_reward(address user, int data_used_bytes) {
        require(proof_records.has(user), "Proof not submitted");

        int bytes_in_1GB = 1073741824; // 2^30 bytes
        int data_used_gb = data_used_bytes / bytes_in_1GB;
        int reward_amount = data_used_gb * reward_rate_per_gb;

        reward_balances.set(user, reward_balances.get(user, 0) + reward_amount);
    }

    // Fungsi distribusi reward ke user
    external fun distribute_reward(address user, address jetton_wallet) {
        int reward = reward_balances.get(user, 0);
        require(reward > 0, "No reward to distribute");

        // Panggil jetton wallet untuk transfer token
        send_jetton_transfer(jetton_wallet, user, reward);

        // Reset saldo reward user
        reward_balances.set(user, 0);
    }

    // Internal: Fungsi mengirimkan OWNIX token
    internal fun send_jetton_transfer(address wallet, address to, int amount) {
        // Implementasi panggilan transfer jetton
        // Sesuai dengan ABI wallet Jetton (ownix_jetton_minter.tact)
        send_raw_message(wallet, build_jetton_transfer(to, amount), 1);
    }

    // Internal: Bangun cell data untuk transfer Jetton
    internal fun build_jetton_transfer(address to, int amount) returns (cell) {
        // Struktur dasar transfer jetton
        return begin_cell()
            .store_uint(0xf8a7ea5, 32) // Op code transfer jetton
            .store_uint(0, 64)         // Query id (auto zero)
            .store_address(to)         // Address penerima
            .store_address(null)       // Response destination (null)
            .store_coins(amount)       // Amount token dikirim
            .store_uint(0, 1)           // Forward payload in separate cell
            .end_cell();
    }
}
