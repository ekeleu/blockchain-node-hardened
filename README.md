# ETH-Sentinel-2026: High-Performance Node Deployment

## Hardware Profile
* **Compute:** 8-Core CPU / 32GB DDR4 RAM
* **Storage:** 2TB NVMe (Dedicated Warehouse)
* **Status:** Active Mainnet Sync (March 2026)

## Architecture
This repository documents a hardened, decoupled Ethereum stack:
* **Consensus:** Lighthouse (Optimized for 200+ Peers)
* **Execution:** Geth (Snap Sync Mode)
* **Security:** JWT-authenticated Engine API, isolated NVMe data paths.

## Performance Tuning
* **Memory Management:** Transitioning from 2GB sync-cache to 16GB operational-cache post-sync.
* **Storage Optimization:** Leveraging NVMe IOPS to handle the 280M+ account state trie.
* **Observability:** Custom integrated monitoring for both CL and EL layers.

#### State Healing Logs (Verified 00:40 GMT)
- **Account State:** 293.7M Verified
- **Contract Slots:** 1.23B Processed
- **Current Throughput:** ~100k accounts/min

### 🏁 Phase 4: Block Execution
- **State Download:** COMPLETE (375M Accounts)
- **Block Replay:** 1.1M blocks remaining
- **Status:** Validating chain segments against healed state trie.
