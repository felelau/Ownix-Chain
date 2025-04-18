
# File: offchain/ownix_offchain.py

import hashlib
import json
import time

# === Fungsi Hashing Data Sensitif ===
def hash_sensitive_data(user_id, timestamp):
    data = {
        "user_id": user_id,
        "timestamp": timestamp
    }
    json_data = json.dumps(data, sort_keys=True).encode('utf-8')
    return hashlib.sha256(json_data).hexdigest()

# === Fungsi Hitung Reward dari Data Usage ===
def calculate_reward(data_used_bytes, reward_per_gb=10):
    bytes_in_1GB = 1073741824  # 1 GB = 2^30 bytes
    data_used_gb = data_used_bytes / bytes_in_1GB
    reward = data_used_gb * reward_per_gb
    return reward

# === Fungsi Reward System ===
def reward_system(user_data, reward_per_gb=10):
    current_time = int(time.time())

    for user in user_data:
        user_id = user["user_id"]
        data_used = user["data_used"]
        timestamp = user.get("timestamp", current_time)

        # Generate encrypted proof
        encrypted_proof = hash_sensitive_data(user_id, timestamp)

        # Calculate reward
        reward = calculate_reward(data_used, reward_per_gb)

        # Output hasil
        print(f"Encrypted Proof: {encrypted_proof}")
        print(f"User ID (hidden): {user_id[:10]}...")  # hanya sebagian untuk keamanan
        print(f"Data Used: {data_used / (1024 ** 2):.2f} MB")
        print(f"Reward Earned: {reward:.2f} OWNIX tokens")
        print(f"Timestamp: {time.ctime(timestamp)}")
        print("-" * 50)

        # (Opsional) Kirim ke Smart Contract (dummy function)
        send_proof_to_contract(user_id, encrypted_proof, reward)

# === Simulasi kirim ke Smart Contract ===
def send_proof_to_contract(user_id, proof, reward):
    print(f"[Simulasi] Sending proof for {user_id[:10]}... : {proof} with reward {reward:.2f} OWNIX")

# === Main Program ===
if __name__ == "__main__":
    # Contoh data penggunaan
    user_data_usage = [
        {"user_id": "0:abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234", "data_used": 2147483648, "timestamp": 1713456789},  # 2 GB
        {"user_id": "0:efgh5678efgh5678efgh5678efgh5678efgh5678efgh5678efgh5678efgh5678", "data_used": 5368709120, "timestamp": 1713460000},  # 5 GB
        {"user_id": "0:ijkl9012ijkl9012ijkl9012ijkl9012ijkl9012ijkl9012ijkl9012ijkl9012", "data_used": 1073741824, "timestamp": 1713465000},  # 1 GB
    ]

    reward_per_gb = 10  # misalnya 10 OWNIX per 1GB
    reward_system(user_data_usage, reward_per_gb)
