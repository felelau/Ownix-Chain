# File: scripts/reward_trigger.py

from offchain.ownix_offchain import reward_system

def trigger_reward():
    # Data pengguna untuk testing
    user_data_usage = [
        {"user_id": "0:abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234", "data_used": 2147483648, "timestamp": 1713456789},  # 2 GB
        {"user_id": "0:efgh5678efgh5678efgh5678efgh5678efgh5678efgh5678efgh5678efgh5678", "data_used": 5368709120, "timestamp": 1713460000},  # 5 GB
    ]
    
    reward_system(user_data_usage, reward_per_gb=10)

if __name__ == "__main__":
    trigger_reward()
