#!/bin/bash
echo "--- [ BLOCKCHAIN INFRASTRUCTURE STATUS ] ---"

# Cardano (Docker + SSD)
ADA_SYNC=$(docker exec cardano-node cardano-cli conway query tip --mainnet --socket-path /ipc/node.socket 2>/dev/null | jq -r '.syncProgress' || echo "Offline")
echo "ADA (SSD): $ADA_SYNC%"

# Bitcoin (Bare Metal + NVMe)
BTC_RAW=$(bitcoin-cli -datadir=/mnt/warehouse/bitcoin getblockchaininfo 2>/dev/null | jq -r '.verificationprogress')
if [ -z "$BTC_RAW" ]; then
    echo "BTC (NVMe): Offline"
else
    BTC_PERC=$(printf "%.2f" $(echo "$BTC_RAW * 100" | bc -l))
    echo "BTC (NVMe): $BTC_PERC%"
fi

# LND (Check for Pubkey)
LND_PUB=$(lncli --macaroonpath=/mnt/warehouse/lnd_data/data/chain/bitcoin/mainnet/admin.macaroon getinfo 2>/dev/null | jq -r '.identity_pubkey')
if [ -z "$LND_PUB" ]; then
    echo "LND (NVMe): Initializing/Locked"
else
    echo "LND (NVMe): Online [${LND_PUB:0:8}...]"
fi

echo "--------------------------------------------"
