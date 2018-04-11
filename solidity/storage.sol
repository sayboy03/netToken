pragma solidity ^0.4.16;


contract SimpleStorage {
    string storedData;
    string storedData2;

    function set(string x, string y) public {
        storedData = x;
        storedData2 = y;
    }

    function get() public constant returns (string) {
        return storedData;
    }
    
    function getData() public constant returns (string){
        return storedData2;
    }
}
