<template>
  <div>
    <button @click="mint">Atomic Mint NFT+SBT</button>
    <p v-if="status">{{ status }}</p>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { ethers } from 'ethers'
import AtomicMintAbi from '../../artifacts/contracts/AtomicMint.sol/AtomicMint.json'

const status = ref("")

async function mint() {
  try {
    if (!window.ethereum) {
      status.value = "No wallet connected"
      return
    }
    const provider = new ethers.providers.Web3Provider(window.ethereum)
    const signer = provider.getSigner()
    const contract = new ethers.Contract(import.meta.env.VITE_ATOMIC_CONTRACT, AtomicMintAbi.abi, signer)
    const tx = await contract.atomicMint(await signer.getAddress(), "ipfs://example")
    await tx.wait()
    status.value = "✅ Mint successful"
  } catch (err) {
    status.value = "❌ " + err.message
  }
}
</script>
