
import hashlib
import json

def generate_ownix_proof(data):
    json_data = json.dumps(data, sort_keys=True).encode('utf-8')
    hash_object = hashlib.sha256(json_data)
    encrypted_hash = hash_object.hexdigest()
    return encrypted_hash

if __name__ == "__main__":
    data_usage = {
        "user_id": "0:abcd1234...",
        "bytes_used": 2000,
        "timestamp": 1713456789
    }

    proof = generate_ownix_proof(data_usage)
    print("Encrypted Hash Proof:", proof)
