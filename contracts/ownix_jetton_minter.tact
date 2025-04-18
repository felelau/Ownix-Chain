
// File: ownix_jetton_minter.tact

contract OwnixJettonMinter {
    // Pemilik minter
    address owner;

    // Total supply maximum (8 miliar * 10^9 untuk nanoOWNIX)
    int constant TOTAL_SUPPLY = 8000000000 * 1000000000;

    // Mapping saldo per user
    map<address, int> balances;

    // Total minted supply
    int total_minted;

    // Constructor
    constructor(address _owner) {
        owner = _owner;
        total_minted = 0;
    }

    // Fungsi mint, hanya oleh owner
    external fun mint(address to, int amount) {
        require(sender() == owner, "Only owner can mint");
        require(total_minted + amount <= TOTAL_SUPPLY, "Exceeds total supply");

        balances.set(to, balances.get(to, 0) + amount);
        total_minted += amount;
    }

    // Fungsi transfer token
    external fun transfer(address to, int amount) {
        require(balances.get(sender(), 0) >= amount, "Insufficient balance");

        balances.set(sender(), balances.get(sender(), 0) - amount);
        balances.set(to, balances.get(to, 0) + amount);
    }

    // Fungsi lihat saldo user
    external fun balance_of(address user) returns (int) {
        return balances.get(user, 0);
    }

    // Fungsi lihat total minted
    external fun get_total_minted() returns (int) {
        return total_minted;
    }
}
