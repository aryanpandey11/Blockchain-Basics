// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage{
    //Keywords for Overriding: virtual (for the base function), override (for the overriding function)

    function store(uint256 _favouriteNumber) public override {
        favouriteNumber = _favouriteNumber + 5;
    }
}