// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./SBT.sol";
import "./TBAFactory.sol";

contract AtomicMint is ERC721URIStorage, Ownable {
    uint256 private _tokenIds;
    SBT private sbt;
    TBAFactory private tbaFactory;

    constructor(address sbtAddress, address tbaFactoryAddress) ERC721("OKEAtomicNFT", "OAN") {
        sbt = SBT(sbtAddress);
        tbaFactory = TBAFactory(tbaFactoryAddress);
    }

    function atomicMint(address to, string memory tokenURI) public onlyOwner returns (uint256, address) {
        _tokenIds++;
        uint256 newItemId = _tokenIds;
        _mint(to, newItemId);
        _setTokenURI(newItemId, tokenURI);

        // Mint SBT to same user
        sbt.safeMint(to, newItemId);

        // Create TBA for the NFT
        address tba = tbaFactory.createAccount(address(this), newItemId, block.chainid);

        return (newItemId, tba);
    }
}
