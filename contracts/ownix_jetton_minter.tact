
contract OwniXJettonMinter {
    address admin;
    uint256 totalSupply;

    event Mint(address indexed to, uint256 amount);

    constructor(address _admin) public {
        admin = _admin;
        totalSupply = 0;
    }

    function mint(address to, uint256 amount) external onlyAdmin {
        totalSupply += amount;
        emit Mint(to, amount);
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can mint tokens");
        _;
    }
}
