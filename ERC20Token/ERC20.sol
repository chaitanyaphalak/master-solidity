pragma solidity ^0.4.20;

import "./ERC20Interface.sol";

contract ERC20 is ERC20Interface {
    
    uint constant private MAX_UINT = 2**256 - 1;
    mapping (address => uint) public balances;
    mapping (address => mapping (address => uint)) public allowed;
    
    string public name;
    uint public decimals;
    string public symbol;
    
    function ERC20(uint _initialAmount, string _tokenName, uint _decimalUnits, string _tokenSymbol) public {
        balances[msg.sender] = _initialAmount;
        totalSupply = _initialAmount;
        name = _tokenName;
        decimals = _decimalUnits;
        symbol = _tokenSymbol;
    }
    
    function transfer(address _to, uint _value) public returns (bool) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    
    function transferFrom(address _from, address _to, uint _value) public payable returns (bool) {
        uint allowance = allowed[_from][msg.sender];
        require(balances[_from] >= _value && allowance >= _value);
        balances[_to] += _value;
        balances[_from] -= _value;
        if(allowance < MAX_UINT) {
            allowed[_from][msg.sender] -= _value;
        }
        emit Transfer(_from, _to, _value);
        return true;
    }
    
    function balanceOf(address _owner) public view returns (uint) {
        return balances[_owner];
    }
    
    function approve(address _spender, uint _value) public returns (bool) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    
    function allowance(address _owner, address _spender) public view returns (uint) {
        return allowed[_owner][_spender];
    }
}
