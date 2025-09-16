<template>
  <div id="app">
    <h1>OKE Atomic Mumbai Demo</h1>
    <WalletButton @connected="onConnected"/>
    <AtomicMint v-if="walletConnected"/>
    <OKECard v-if="walletConnected"/>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import WalletButton from './components/WalletButton.vue'
import AtomicMint from './components/AtomicMint.vue'
import OKECard from './components/OKECard.vue'

const walletConnected = ref(false)

function onConnected() {
  walletConnected.value = true
}
</script>
