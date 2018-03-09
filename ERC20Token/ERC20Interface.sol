pragma solidity ^0.4.20;

contract ERC20Interface {
    uint public totalSupply;
    
    function balanceOf(address _owner) public view returns (uint);
    function transfer(address _to, uint _value) public returns (bool);
    function transferFrom(address _from, address _to, uint value) public payable returns (bool);
    function approve(address _spender, uint value) public returns (bool);
    function allowance(address _owner, address _spender) public view returns (uint);
    
    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}
