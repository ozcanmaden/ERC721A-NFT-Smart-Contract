pragma solidity ^0.8.0;

import "./ERC721A.sol";

contract MyNft is ERC721A {
    uint256 private collectionSize;
    string public baseURI;    
    //totalsupply toplam nft sayısı constructor da iste mint de require koyarsın
    constructor(uint256 _maxBatchSize,uint256 _collectionSize) ERC721A("My NFT", "MNFT", _maxBatchSize) {
        collectionSize=_collectionSize;
    }

    function setBaseURI(string calldata _tokenBaseURI) external onlyOwner {
        baseURI = _tokenBaseURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }


    function mint(uint256 quantity) public {
        require(collectionSize>totalSupply(),"All NFTs minted");
        _safeMint(msg.sender, quantity);
    }
}