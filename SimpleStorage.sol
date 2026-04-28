// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {

    address public owner;
    uint256 private storedValue;

    event ValueChanged(uint256 newValue, address changedBy);

    constructor() {
        owner = msg.sender;
    }

    // Store a value
    function setValue(uint256 _value) public {
        storedValue = _value;
        emit ValueChanged(_value, msg.sender);
    }

    // Get stored value
    function getValue() public view returns (uint256) {
        return storedValue;
    }

    // Only owner function
    function onlyOwnerSet(uint256 _value) public {
        require(msg.sender == owner, "Not owner");
        storedValue = _value;
        emit ValueChanged(_value, msg.sender);
    }
}