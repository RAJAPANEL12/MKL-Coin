// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MKLCoin {
    string public name = "MKL Coin";
    string public symbol = "MKL";
    uint8 public decimals = 18;
    uint256 public totalSupply = 5000000 * (10 ** uint256(decimals));
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance.");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        return true;
    }

    function approve(address spender, uint256 amount) public returns (bool) {
        allowance[msg.sender][spender] = amount;
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public returns (bool) {
        require(balanceOf[from] >= amount, "Insufficient balance.");
        require(allowance[from][msg.sender] >= amount, "Allowance exceeded.");
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        allowance[from][msg.sender] -= amount;
        return true;
    }
}
