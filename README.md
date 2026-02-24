# Dual-Stack Node Infrastructure: Bitcoin & Algorand
## Resource Orchestration & Optimization

In a dual-stack environment (BTC + ALGO) on a single NVMe, CPU and I/O contention are inevitable during Initial Block Download (IBD) and Catchpoint Verification. 

### The Engineering Solution
1. **Dynamic Prioritization:** Implemented `systemd` resource controls.
2. **CPU Management:** Set Bitcoin to `Nice=15` (lower priority) to ensure the Algorand `algod` process has sufficient cycles for hashing and verification.
3. **I/O Scheduling:** Utilized `ionice` (Class 2, Priority 7) for Bitcoin, ensuring Algorand's database commits take precedence on the NVMe bus.
# blockchain-node-hardened
