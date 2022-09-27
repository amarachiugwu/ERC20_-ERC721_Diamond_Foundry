// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {AppStorage} from "../libraries/AppStorage.sol";
import {ERC721URIStorage} from "./ERC721URIStorageFacet.sol";
import {Counters} from "../libraries/Counter.sol";




contract ERC721MintFacet is ERC721URIStorage {
    using Counters for Counters.Counter;

    // AppStorage internal s;

    function safeMint(address to, string memory uri) public{

        uint256 tokenId = s._myCounter.current();
        require(tokenId <= s.MAX_SUPPLY, "Sorry, all NFTs have been minted!");
        s._myCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }


}