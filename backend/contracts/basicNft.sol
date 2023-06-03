// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    string public constant TOKEN_URI = "ipfs://Qma5NXwRDmH726uD1p5FmQCgpMYkMJTbVcv3ECGfw2qAwb";
    uint256 private s_tokCounter;

    event DogMinted(uint256 indexed tokenId);

    constructor() ERC721("Dogie", "DOG") {
        s_tokCounter = 0;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokCounter);
        emit DogMinted(s_tokCounter);
        s_tokCounter = s_tokCounter + 1;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return TOKEN_URI;
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokCounter;
    }
}
