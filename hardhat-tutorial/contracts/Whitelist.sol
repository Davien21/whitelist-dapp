//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    // Max number of whitelisted addresses allowed
    uint256 public maxNumberOfWhitelistedAddresses;

    
    // Create a mapping of whitelistedAddresses
    // if an address is whitelisted, we would set it to true, it is false by default for all other addresses.
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint256 public whitelistedAddressCount;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint256 _maxNumberOfWhitelistedAddresses) {
        maxNumberOfWhitelistedAddresses = _maxNumberOfWhitelistedAddresses;
    }

      /**
        addAddressToWhitelist - This function adds the address of the sender to the
        whitelist
     */

     function addAddressToWhitelist () public {
         // check if the user has already been whitelisted, avoid unneeded write.
         require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
         // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
         require(whitelistedAddressCount < maxNumberOfWhitelistedAddresses, "More addresses cant be added, limit reached");
         whitelistedAddresses[msg.sender] = true;
         // Increase the number of whitelisted addresses
         whitelistedAddressCount +=1;
     }
}