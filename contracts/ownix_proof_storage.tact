
import OwniXJettonMinter from "./ownix_jetton_minter.tact";

contract OwniXProofStorage {
    mapping(address => bytes32) public usageProofs;
    OwniXJettonMinter public minterContract;
    uint256 rewardPerProof;

    event ProofSubmitted(address indexed user, bytes32 proofHash);

    constructor(address minterAddress, uint256 _rewardPerProof) public {
        minterContract = OwniXJettonMinter(minterAddress);
        rewardPerProof = _rewardPerProof;
    }

    function submitProof(bytes32 proofHash) external {
        usageProofs[msg.sender] = proofHash;
        emit ProofSubmitted(msg.sender, proofHash);
        minterContract.mint(msg.sender, rewardPerProof);
    }

    function getProof(address user) public view returns (bytes32) {
        return usageProofs[user];
    }
}
