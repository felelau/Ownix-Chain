// Contract for OwniX Jetton Minting on TON Blockchain

contract OwniXJettonMinter {

    // Admin address and state variables
    address admin;
    uint256 totalSupply;
    uint256 maxSupply = 8000000000 * 1e9;  // 8 billion tokens with 9 decimals (adjustable for precision)

    // Mint event and total supply event
    event Mint(address indexed to, uint256 amount);
    event TotalSupply(uint256 totalSupply);

    // Constructor to initialize admin address
    constructor(address _admin) {
        admin = _admin;
        totalSupply = 0;
    }

    // Modifier to restrict minting only to the admin
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can mint tokens");
        _;
    }

    // Function to mint tokens
    function mint(address to, uint256 amount) external onlyAdmin {
        require(totalSupply + amount <= maxSupply, "Max supply reached");
        totalSupply += amount;
        emit Mint(to, amount);
        emit TotalSupply(totalSupply);
    }

    // Function to get the current total supply
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

}

