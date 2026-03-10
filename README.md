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

### 🛰️ Project Evolution: Multi-Chain Expansion (BTC Sentinel)

Following the successful deployment of the Ethereum stack, the infrastructure was expanded to include a dedicated Bitcoin Full Node utilizing a tiered storage model.
New Implementation: The 1TB Blockchain Vault

    Protocol: Bitcoin Core (Mainnet)

    Storage Tiering: Offloaded block data to a 1TB External SSD (SDB1) via UAS5000 bridge to preserve NVMe IOPS for Ethereum's state trie.

    Resource Management: Implemented a "Sprint Mode" configuration, allocating a 16GB dbcache to accelerate Initial Block Download (IBD).

Infrastructure on a Stick (Project 2)

The Bitcoin node has been modularized into a Dockerized Environment, allowing for total portability.

    IaC: Managed via docker-compose.yml.

    Volume Mapping: Seamless handoff between bare-metal sync and containerized operation.

    Repository: ekeleu/sentinel-btc-vault
> **Project Validation:** Successfully maintained 15+ active IPv4 P2P connections over a Three UK CGNAT gateway.
