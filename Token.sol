// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Token {

    constructor() {
        name = "Token";
        symbol =  "TKN";
        totalSupply = 1000000;
        balances[msg.sender] = totalSupply;
    }

    // Storage
    mapping(address => uint256) public balances;

    uint256 public totalSupply;
    string public name;
    string public symbol;

    // Functions
    function getTotalSupply() public view returns(uint256) {
        return totalSupply;
    }

    function transfer(address _sender, address _recipient, uint256 _amount) public {
        require(balances[_sender] >= _amount, "transfer amount exceeds balance");
        balances[_recipient] += _amount;
        balances[_sender] -= _amount;
        burn();
        emit Transfer(_sender, _recipient, _amount);
    }

    function burn() internal {
        uint256 burnPercent = totalSupply / 200;
        totalSupply -= burnPercent;
    }

    // Events
    event Transfer(address indexed _sender, address indexed _recipient, uint256 _amount);
    
}