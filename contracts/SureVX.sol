pragma solidity ^0.5.1;

contract CollatFactory {
    address[] public collatAddresses;
    
    function createCollat() public {
        Collat c = new Collat();
        collatAddresses.push(address(c));
    }
    
    function getCollatCount() public view returns(uint collatCount) {
        return collatAddresses.length;
    }
}

contract Collat { 
    
    // Variables here
    
    constructor () public {
        // TODO
    }
}