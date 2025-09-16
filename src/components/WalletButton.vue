<template>
  <div>
    <button @click="connectMetaMask">Connect MetaMask</button>
    <button @click="connectWalletConnect">Connect WalletConnect</button>
    <p v-if="account">Connected: {{ account }}</p>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { ethers } from 'ethers'
import WalletConnectProvider from "@walletconnect/web3-provider"

const account = ref(null)

async function connectMetaMask() {
  if (window.ethereum) {
    const provider = new ethers.providers.Web3Provider(window.ethereum)
    await provider.send("eth_requestAccounts", [])
    const signer = provider.getSigner()
    account.value = await signer.getAddress()
    emit("connected")
  } else {
    alert("MetaMask not detected")
  }
}

async function connectWalletConnect() {
  const provider = new WalletConnectProvider({
    rpc: {
      80001: "https://rpc-mumbai.maticvigil.com"
    }
  })
  await provider.enable()
  const web3Provider = new ethers.providers.Web3Provider(provider)
  const signer = web3Provider.getSigner()
  account.value = await signer.getAddress()
  emit("connected")
}
</script>
