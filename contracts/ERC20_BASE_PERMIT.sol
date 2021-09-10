// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";

contract Token is ERC20, ERC20Burnable, ERC20Permit {
    constructor(string memory name, string memory symbol, uint256 max_supply) ERC20(name, symbol)  ERC20Permit(name){
        _mint(msg.sender, max_supply * 10 ** decimals());
    }
}