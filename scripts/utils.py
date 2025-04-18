# File: scripts/utils.py

from tonos_ts4 import ts4

def send_transaction(contract_address, method, params):
    # Koneksi ke Testnet/Mainnet
    client = ts4.Client('https://net.ton.dev')  # Ganti dengan URL mainnet jika perlu
    wallet = ts4.Wallet.from_seed('SEED_PHRASE')  # Ganti dengan seed phrase Anda
    
    # Kirim transaksi ke kontrak
    contract = client.contract(contract_address)
    result = contract.call(method, params, wallet)
    return result

if __name__ == "__main__":
    # Contoh penggunaan
    contract_address = "your_contract_address_here"
    method = "submit_proof"
    params = {"user": "0:abcd1234...", "proof_hash": "sample_hash_here"}
    result = send_transaction(contract_address, method, params)
    print("Transaction result:", result)
