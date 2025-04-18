
import hashlib
import json
import time

# Fungsi untuk meng-hash data sensitif (misalnya user_id, data_used, timestamp)
def hash_sensitive_data(data):
    json_data = json.dumps(data, sort_keys=True).encode('utf-8')  # Mengubah data menjadi format JSON
    hash_object = hashlib.sha256(json_data)  # Meng-hash data dengan SHA-256
    return hash_object.hexdigest()  # Mengembalikan hasil hash sebagai proof

# Fungsi untuk menghitung reward dari data usage
def calculate_reward(data_used_bytes, reward_per_gb):
    bytes_in_1GB = 1073741824  # 1 GB = 2^30 bytes
    data_used_gb = data_used_bytes / bytes_in_1GB  # Menghitung jumlah data yang digunakan dalam GB
    reward = data_used_gb * reward_per_gb  # Menghitung reward berdasarkan data yang digunakan
    return reward

# Fungsi utama untuk memproses data pengguna, menghitung reward dan hashing data
def process_user_data(user_data, reward_per_gb=10):
    current_time = time.time()  # Waktu saat ini (Unix timestamp)

    for user in user_data:
        user_id = user["user_id"]
        data_used = user["data_used"]
        timestamp = user.get("timestamp", current_time)

        # Data sensitif yang perlu di-hash (user_id, data_used, timestamp)
        sensitive_info = {
            "user_id": user_id,
            "data_used": data_used,
            "timestamp": timestamp
        }

        # Menghasilkan bukti hash dari data sensitif
        encrypted_proof = hash_sensitive_data(sensitive_info)

        # Menghitung reward
        reward = calculate_reward(data_used, reward_per_gb)

        # Output bukti hash dan reward
        print(f"Encrypted Proof (Hash): {encrypted_proof}")
        print(f"User ID: {user_id}")
        print(f"Data Used: {data_used / (1024 ** 2):.2f} MB")
        print(f"Reward Given: {reward:.2f} tokens")
        print(f"Timestamp: {time.ctime(timestamp)}")
        print("-" * 50)

if __name__ == "__main__":
    # Contoh data penggunaan
    user_data_usage = [
        {"user_id": "0:abcd1234...", "data_used": 2147483648, "timestamp": 1713456789},  # 2 GB
        {"user_id": "0:efgh5678...", "data_used": 5368709120, "timestamp": 1713459889},  # 5 GB
        {"user_id": "0:ijkl9012...", "data_used": 1073741824, "timestamp": 1713460989},  # 1 GB
    ]

    reward_per_gb = 10  # Misalnya 10 token OWNIX per GB

    process_user_data(user_data_usage, reward_per_gb)
