contract OwniXJettonMinter {
    address admin;
    uint256 totalSupply;
    uint256 maxSupply = 8000000000 * 1e9;  // 8 billion tokens with 9 decimals (adjustable for precision)

    event Mint(address indexed to, uint256 amount);
    event TotalSupply(uint256 totalSupply);

    constructor(address _admin) public {
        admin = _admin;
        totalSupply = 0;
    }

    function mint(address to, uint256 amount) external onlyAdmin {
        require(totalSupply + amount <= maxSupply, "Max supply reached");
        totalSupply += amount;
        emit Mint(to, amount);
        emit TotalSupply(totalSupply);
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can mint tokens");
        _;
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }
}

