// File: ownix_proof_storage.tact

contract OwnixProofStorage {
    // Address pemilik (admin contract)
    address owner;

    // Mapping penyimpanan proof per user
    map<address, cell> user_proofs;

    // Constructor
    constructor(address _owner) {
        owner = _owner;
    }

    // Fungsi untuk menyimpan proof hash
    external fun submit_proof(address user, cell proof_hash) {
        require(sender() == user || sender() == owner, "Unauthorized sender");
        user_proofs.set(user, proof_hash);
    }

    // Fungsi untuk memverifikasi proof hash sudah ada
    external fun has_proof(address user) returns (bool) {
        return user_proofs.has(user);
    }

    // Fungsi untuk ambil proof hash
    external fun get_proof(address user) returns (cell) {
        require(user_proofs.has(user), "Proof not found");
        return user_proofs.get(user);
    }
}
