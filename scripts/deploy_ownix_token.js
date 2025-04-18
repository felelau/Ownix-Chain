
const TonWeb = require("tonweb");

async function deployOwniXToken() {
    const tonweb = new TonWeb(new TonWeb.HttpProvider('https://testnet.toncenter.com/api/v2/jsonRPC'));

    const adminAddress = "YOUR_WALLET_ADDRESS";

    const contract = new tonweb.contracts.OwniXJettonMinter({
        admin: adminAddress
    });

    const deploy = await contract.deploy({
        amount: TonWeb.utils.toNano("0.5"),
        from: adminAddress
    });

    console.log("OwniX Token deployed at:", deploy.address.toString());
}

deployOwniXToken();
