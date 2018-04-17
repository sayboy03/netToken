pragma solidity ^0.4.16;


//0x13c55bfd7f577ee5cf7b76edd636eabf4d094e1a


contract Factory {
    address[] public newContracts;
    uint256[] public Trips;
    
    function createContract (uint256 tripId) {
        address newContract = new Contract(tripId);
        newContracts.push(newContract);
    } 
    
}

contract Contract {
    uint256 public TripId;
    string public TempData;

    function Contract (uint256 tripId) public {
        TripId = tripId;
    }
    
    function set(string tempData) public {
        TempData = tempData;
    }

    function get() public constant returns (uint256) {
        return TripId;
    }
    
    function getData() public constant returns (string) {
        return TempData;
    }
    
}

// contract Contract {
//     uint256 public Trip;
//   // string public tempData;

//     function Contract (uint256 tripId) {
//         Trip = tripId;
//     }
    
// }
