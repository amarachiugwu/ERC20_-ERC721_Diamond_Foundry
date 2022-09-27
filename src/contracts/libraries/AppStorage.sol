// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Counters} from "./Counter.sol";

struct AppStorage {

	 // Token name
    string _name;

    // Token symbol
    string _symbol;

    // Mapping from token ID to owner address
    mapping(uint256 => address) _owners;

    // Mapping owner address to token count
    mapping(address => uint256) _balances;

    // Mapping from token ID to approved address
    mapping(uint256 => address) _tokenApprovals;

    // Mapping from owner to operator approvals
    mapping(address => mapping(address => bool)) _operatorApprovals;

    // Mapping from owner to list of owned token IDs
    mapping(address => uint256[]) _ownedTokens;

    // Mapping from token ID to index of the owner tokens list
    mapping(uint256 => uint256) _ownedTokensIndex;

    // Mapping from owner to number of owned token
    mapping(address => uint256) _ownedTokensCount;

    // Optional mapping for token URIs
    mapping(uint256 => string) _tokenURIs;

    // Base URI
    string _baseURI;

    // Mapping from token ID to position in the allTokens array
    mapping(uint256 => uint256) _allTokensIndex;

    // Array with all token ids, used for enumeration
    uint256[] _allTokens;  

    Counters.Counter _myCounter;
      
    uint256 MAX_SUPPLY;
}