const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("AtomicMint", function () {
  it("Should mint NFT and SBT and create TBA", async function () {
    const [owner, addr1] = await ethers.getSigners();

    const SBT = await ethers.getContractFactory("SBT");
    const sbt = await SBT.deploy();
    await sbt.deployed();

    const TBAFactory = await ethers.getContractFactory("TBAFactory");
    const tbaFactory = await TBAFactory.deploy();
    await tbaFactory.deployed();

    const AtomicMint = await ethers.getContractFactory("AtomicMint");
    const atomicMint = await AtomicMint.deploy(sbt.address, tbaFactory.address);
    await atomicMint.deployed();

    const tx = await atomicMint.atomicMint(addr1.address, "ipfs://tokenURI");
    const receipt = await tx.wait();

    expect(await atomicMint.ownerOf(1)).to.equal(addr1.address);
    expect(await sbt.ownerOf(1)).to.equal(addr1.address);
  });
});
