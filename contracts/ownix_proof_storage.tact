// Contract for storing data usage proofs in OwniX ecosystem

contract OwniXProofStorage {

    // Struktur data untuk menyimpan bukti penggunaan data
    struct DataUsageProof {
        string userId;
        uint256 timestamp;
        string proofHash; // Hash dari data yang disimpan
    }

    // Map untuk menyimpan bukti berdasarkan userId
    mapping(string => DataUsageProof) public proofs;

    // Event yang dipicu saat bukti disimpan
    event ProofStored(string indexed userId, string proofHash, uint256 timestamp);

    // Fungsi untuk menyimpan bukti penggunaan data
    function storeProof(string userId, uint256 timestamp, string proofHash) public {
        // Simpan bukti dalam mapping
        proofs[userId] = DataUsageProof(userId, timestamp, proofHash);

        // Emit event untuk memberi tahu bahwa bukti sudah disimpan
        emit ProofStored(userId, proofHash, timestamp);
    }

    // Fungsi untuk mendapatkan bukti berdasarkan userId
    function getProof(string userId) public view returns (string, uint256, string) {
        DataUsageProof proof = proofs[userId];
        return (proof.userId, proof.timestamp, proof.proofHash);
    }

}
