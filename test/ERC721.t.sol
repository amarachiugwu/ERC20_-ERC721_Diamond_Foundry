// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/contracts/libraries/AppStorage.sol";
import "../src/contracts/facets/ERC721TokenFacet.sol";
import "../src/contracts/facets/ERC721MintFacet.sol";
import "../src/contracts/libraries/Counter.sol";


contract ERC721Test is Test {
    using Counters for Counters.Counter;
    AppStorage internal s;
    ERC721 public eRC721;
    ERC721MintFacet public eRC721MintFacet;
    address to;
    uint256 tokenId;

    function setUp() public {

        eRC721 = new ERC721();
        eRC721MintFacet = new ERC721MintFacet();
        to = address(0x2c5F2886100114C10833dF2E52Ebfab54D59dfc9);
        tokenId = s._myCounter.current();

    }

    function testBalanceOf() public {
        assertEq(eRC721.balanceOf(msg.sender), 0);
        eRC721MintFacet.safeMint(msg.sender, 'QmNjVnsmUiGK7gYa6YVrYS7745ciZEmxk7tSw7StmLPxVq');
        assertEq(eRC721.balanceOf(msg.sender), 1);
    }

    function testSafeTransferFrom() public {
        assertEq(eRC721.balanceOf(address(to)), 0);
        eRC721MintFacet.safeMint(msg.sender, 'QmNjVnsmUiGK7gYa6YVrYS7745ciZEmxk7tSw7StmLPxVq');
        // emit log_named_uint(tokenId, 1);
        eRC721.safeTransferFrom(msg.sender, to, tokenId);
        assertEq(eRC721.balanceOf(address(to)), 1);
    }


}
