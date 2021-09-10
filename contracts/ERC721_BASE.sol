//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract COLLECTION is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    struct ItemParam {
        address to;
        string tokenURI;
    }

    string _contractURI;

    constructor(string memory name_, string memory symbol_, string memory contractURI_)
     ERC721(name_, symbol_) {
        _contractURI = contractURI_;

    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://";
    }

    function contractURI() public view returns (string memory) {
        return string(abi.encodePacked("ipfs://", _contractURI));
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function setTokenURI(uint256 tokenId_, string memory tokenURI_) public onlyOwner {
        _setTokenURI(tokenId_, tokenURI_);
    }

     function multiSafeMint(ItemParam[] memory items) public onlyOwner {
        for (uint i = 0; i < items.length; i++) {
            _safeMint(items[i].to, _tokenIdCounter.current());
            _setTokenURI(_tokenIdCounter.current(), items[i].tokenURI);
            _tokenIdCounter.increment();
        }      
    }

     function safeMint(address to, string memory tokenURI_) public onlyOwner {
        _safeMint(to, _tokenIdCounter.current());
        _setTokenURI(_tokenIdCounter.current(), tokenURI_);
        _tokenIdCounter.increment();
    }

}