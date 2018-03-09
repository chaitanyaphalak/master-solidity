pragma solidity ^0.4.20;

contract CPBank {
    mapping (address => uint) private balances;
    address public owner;
    
    event LogMoneyDeposited(address account, uint amount);
    
    function CPBank() public {
        owner = msg.sender;
    }
    
    function depositMoney() public payable returns (uint) {
        require((balances[msg.sender] + msg.value) >= balances[msg.sender]);
        balances[msg.sender] += msg.value;
        emit LogMoneyDeposited(msg.sender, msg.value);
        return balances[msg.sender];
    }
    
    function withdrawMoney(uint amountToWithdraw) public returns (uint) {
        require(balances[msg.sender] >= amountToWithdraw);
        balances[msg.sender] -= amountToWithdraw;
        return balances[msg.sender];
    }
    
    function getBalance() public constant returns (uint) {
        return balances[msg.sender];
    }
    
    function () public payable {
        revert();
    }
}
