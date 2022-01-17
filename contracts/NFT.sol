// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol
contract NFT is ERC721URIStorage {

    // Magic given to us by OpenZeppelin to help us keep track of tokenIds
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // We need to pass the name of our NFTs and its symbol
    constructor() ERC721 ("EpicNFT", "EPIC") {
        console.log("This is my NFT contract. Whoa!");
    }

    // A function our user will hit to get their NFT
    function makeAnEpicNFT() public {
        // Get the current tokenId, this starts at 0
        uint256 tokenId = _tokenIds.current();
        string memory tokenURI = "https://jsonkeeper.com/b/3GOP";

        // Actually mint the NFT to the sender using the msg.sender
        _safeMint(msg.sender, tokenId);

        // Actually mint the NFT to the sender using the msg.sender
        _setTokenURI(tokenId, tokenURI);

        // Incrememn the counter for when the next NFT is minted
        _tokenIds.increment();

        // Log this to the console
        console.log("An NFT w/ ID %s has been minted to %s", tokenId, msg.sender);
    }
}
