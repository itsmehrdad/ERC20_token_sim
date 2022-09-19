// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC20.sol";
 contract Token is ERC20
 {
     constructor () ERC20("woas","was",1000000 * 1e5,5)
     {
        _balances[_msgSender()] = 1000000 * 1e5 ;
     }
 }