pragma solidity ^0.4.16;

import "browser/storage.sol";
//interface netTokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) external; }
 
contract NetmaniaToken is SimpleStorage{

    // Public variables of the token

    string public name;
    string public symbol;
    uint8 decimals = 0;
    uint256 public totalSupply;


    // This creates an array with all balances
    mapping (address => uint256) public balanceOf;
   // mapping (address => mapping (address => uint256)) public allowance;

 
    // This generates a public event on the blockchain that will notify clients
    event Transfer(address indexed from, address indexed to, uint256 value);

    function NetmaniaToken(
        uint256 initialSupply,
        string tokenName,
        string tokenSymbol
    ) public {
        totalSupply = initialSupply * 10 ** uint256(decimals);  // Update total supply with the decimal amount
        balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
        name = tokenName;                                   // Set the name for display purposes
        symbol = tokenSymbol;                               // Set the symbol for display purposes
    }


    function _transferToken(address _from, address _to,  uint _value) internal {
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_to != 0x0);
        // Check if the sender has enough
        require(balanceOf[_from] >= _value);
        // Check for overflows
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        // Save this for an assertion in the future
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        // Subtract from the sender
        balanceOf[_from] -= _value;
        // Add the same to the recipient
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }

    function transferToken(address _from, uint256 _value) public{
        _transferToken(msg.sender, _from, _value);
    }
}
