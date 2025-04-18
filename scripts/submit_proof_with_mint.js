
const TonWeb = require("tonweb");

async function submitOwniXProof(userAddress, proofHash) {
    const tonweb = new TonWeb(new TonWeb.HttpProvider('https://testnet.toncenter.com/api/v2/jsonRPC'));

    const contract = new tonweb.contracts.OwniXProofStorage({
        address: "OWNIX_PROOF_CONTRACT_ADDRESS"
    });

    const tx = await contract.methods.submitProof(proofHash).send({
        from: userAddress,
        amount: TonWeb.utils.toNano("0.05")
    });

    console.log("Proof submitted and auto-mint triggered:", tx);
}

const user = "YOUR_WALLET_ADDRESS";
const proof = "YOUR_GENERATED_HASH";

submitOwniXProof(user, proof);
