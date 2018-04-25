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
    uint256 public TripId;
    string public tempData;
    
    function Contract () {
        
    }

    function set(uint256 x, string y) public {
        TripId = x;
        tempData = y;
    }

    function get() public constant returns (uint256) {
        return TripId;
    }
    
    function getData() public constant returns (string) {
        return tempData;
    }

 
    
}
