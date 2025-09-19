# OKE Atomic Vue Project


OKE_ATOMIC_MUMBAI_VUE_PROJECT


contracts/

AtomicMint.sol（NFT+SBT　”Atomic”Mint）

TBAFactory.sol（ERC-6551　Account生成）

SBT.sol（ERC-5192準拠）

Hardhat　project　　estcode

src/

App.vue（全体UI）

components/WalletButton.vue

components/AtomicMint.vue

components/OKECard.vue

firebase/

firebase.json

functions/index.js（Google AI Studio←API）

その他

README.md（Japanese/English）

.env.local.example / .env.secret.example

package.json（依存関係）


# OKE ATOMIC Mumbai Vue Project

## 概要 (Overview)
このプロジェクトは **NFT + SBT 同時発行 (Atomic Mint)** と  
**ERC-6551 Token Bound Account (TBA)** を統合したデモです。  
フロントは Vue + Vite、バックエンドは Firebase + Google AI Studio を利用します。  

This project demonstrates **NFT + SBT Atomic Minting** combined with  
**ERC-6551 Token Bound Accounts (TBA)**.  
Frontend is built with Vue + Vite, backend with Firebase + Google AI Studio.

---

## セットアップ手順 (Setup Instructions)

### 1. 依存関係のインストール (Install dependencies)
```bash
npm install


OKE_ATOMIC_MUMBAI_VUE_PROJECT/
 ├─ contracts/
 │   ├─ AtomicMint.sol
 │   ├─ TBAFactory.sol
 │   └─ SBT.sol
 │   └─ hardhat.config.js
 │   └─ test/
 │       └─ atomicMint.test.js
 ├─ src/
 │   ├─ App.vue
 │   ├─ main.js
 │   └─ components/
 │       ├─ WalletButton.vue
 │       ├─ AtomicMint.vue
 │       └─ OKECard.vue
 ├─ firebase/
 │   ├─ firebase.json
 │   └─ functions/index.js
 ├─ package.json
 ├─ .gitignore
 ├─ README.md
 └─ .env.local.example







contracts/（AtomicMint.sol, TBAFactory.sol, SBT.sol, Hardhat設定+テスト）

src/（App.vue, main.js, WalletButton.vue, AtomicMint.vue, OKECard.vue）

firebase/（firebase.json, functions/index.js）

package.json, .gitignore, .env.local.example

README.md（日英、セットアップ〜デプロイ手順のみ記載）


1. contracts/

AtomicMint.sol

ERC721 (NFT) + ERC5192 (SBT) を同時発行（Atomic Mint）

Mint 時に ERC6551 TBA を生成・紐付け

TBAFactory.sol

ERC6551 アカウント作成用のファクトリー

SBT.sol

譲渡不可の Soulbound Token（ERC-5192 準拠）

Hardhat 構成 & テスト

hardhat.config.js（Mumbai RPC 設定）

test/atomicMint.test.js（基本テスト）

2. src/

App.vue：全体 UI

main.js：エントリーポイント

components/

WalletButton.vue → MetaMask & WalletConnect v2 両対応

AtomicMint.vue → NFT+SBT 同時発行ボタン & 結果表示

OKECard.vue → NFT/SBT/TBA ステータスを表示するカード

3. firebase/

firebase.json → Hosting + Functions rewrite

functions/index.js → Google AI Studio API 呼び出し

4. その他

package.json（Vue+Vite, ethers.js, WalletConnect v2, firebase-admin）

.gitignore（node_modules, dist, .env*）

.env.local.example（Mumbai RPC, Private key, Firebase Config）

README.md（日英併記、セットアップ〜デプロイ手順のみ記載）




# OKE Atomic Mumbai Vue Project

## Setup
```bash
npm install
```

## Run locally
```bash
npm run dev
```

## Deploy Contracts (Hardhat)
```bash
npx hardhat run scripts/deploy.js --network mumbai
```

## Firebase Deploy
```bash


firebase deploy
```

### Environment Variables
See `.env.local.example`.



2. 環境変数の設定 (Environment variables)

.env.local.example をコピーして .env.local を作成し、値を入力してください。

例 (Example):

MUMBAI_RPC_URL=https://rpc-mumbai.maticvigil.com
PRIVATE_KEY=your_private_key
VITE_ATOMIC_CONTRACT=your_deployed_atomic_contract_address
GOOGLE_API_KEY=your_google_api_key


3. スマートコントラクトのデプロイ (Deploy contracts with Hardhat)
4. ローカルで起動 (Run locally)
npm run dev


アプリは http://localhost:5173
 で確認できます。
The app will be available at http://localhost:5173
.

ディレクトリ構成 (Directory Structure)
contracts/     Solidity contracts (NFT, SBT, TBA)
src/           Vue + Vite frontend
firebase/      Firebase Hosting + Functions (AI Studio integration)

主な機能 (Main Features)

✅ Atomic Mint : NFT + SBT 同時発行 (NFT + SBT issued together)

✅ ERC-6551 TBA : 自動生成されるウォレットアカウント (Auto-generated wallet account)

✅ Wallet Integration : MetaMask + WalletConnect v2 対応

✅ OKE Card UI : Mint 結果を表示するカードUI

✅ Firebase Functions : Google AI Studio と接続可能

デプロイ (Deployment)
Firebase
firebase deploy

GitHub + Vercel

リポジトリを Vercel に接続し、自動デプロイを有効にしてください。
Connect repository to Vercel and enable automatic deploys.


---




## Setup
```bash
npm install
```

## Run locally
```bash
npm run dev
```

## Deploy Contracts (Hardhat)
```bash
npx hardhat run scripts/deploy.js --network mumbai
```

## Firebase Deploy
```bash
firebase deploy
```

### Environment Variables
See `.env.local.example`.
