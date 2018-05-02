pragma solidity ^0.4.16;


contract Factory {
    address[] public newContracts;
    //address public lastContract;
    //uint256 public contractCount;
    
    function createContract () {
        address newContract = new Contract();
        newContracts.push(newContract);
    }
    
    function getAddr() public constant returns (address[]) {
        return newContracts;
    }
    
    function getLastAddr() public constant returns (uint256) {
           uint256 contractCount = newContracts.length;
        return contractCount;
    }
    
}

contract Contract {
    string public tempData;
    
    function Contract () {
        
    }

    function set(string y) public {
        tempData = y;
    }
    
    function getData() public constant returns (string) {
        return tempData;
    }

}
