# File: scripts/deploy_contract.py

from tonos_ts4 import ts4
from tonos_ts4 import Contract

def deploy_contract():
    # Koneksi ke TON Testnet/Mainnet
    client = ts4.Client('https://net.ton.dev')  # Bisa ganti dengan mainnet jika perlu
    wallet = ts4.Wallet.from_seed('SEED_PHRASE')  # Ganti dengan seed phrase Anda

    # Set kontrak yang akan di-deploy
    contract_code = open('contracts/ownix_proof_storage.boc', 'rb').read()  # Ganti dengan file .boc kontrak
    contract = Contract(client, wallet)
    contract.deploy(code=contract_code)

    print("Contract deployed successfully!")
    print("Contract address:", contract.address)

if __name__ == "__main__":
    deploy_contract()
