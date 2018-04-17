pragma solidity ^0.4.16;


contract Factory {
    address[] public newContracts;
    
    function createContract (uint256 tripId) {
        address newContract = new Contract(tripId);
        newContracts.push(newContract);
    } 
}

contract Contract {
    uint256 public TripId;
    string public tempData;

    function Contract (uint256 tripId) {
        TripId = tripId;
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

