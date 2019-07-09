pragma solidity ^0.4.0;

contract MyLandContract 

{ 

    struct Land

    {

        address OwnerAddress;

        string Location;

        uint Cost;

        uint LandID;

    }

    address public owner; //government who creates the contract

    uint public totalLandsCounter; // total number of lands bought here

    // About the owner

    function MyLandContract () public

    {

        owner = msg.sender;

        totalLandsCounter = 0;

    }

    // About Land addtion event

    event Add(address _owner, uint _landID);

    // About when Land is transferred event

    event Transfer(address indexed_from, address indexed_to, uint _landID);

    modifier IsOwner

    {

        require(msg.sender == owner);

        _;

    }

    //one person can buy many lands (many land tokens, each token one land)

    mapping (address => Land [])public __OwnedLands;

    // Lands can be bought by the OwnerAddress

    function addLand(string _location, uint _cost)public IsOwner

    {

        totalLandsCounter = totalLandsCounter + 1;

        Land memory myLand = Land(

            {

                OwnerAddress : msg.sender,

                Location : _location,

                Cost : _cost,

                LandID : totalLandsCounter

            });

            __OwnedLands[msg.sender].push (myLand);

            Add (msg.sender, totalLandsCounter);

    }

    // owner can transfer the land to any buyer one and only he is the owner

    function transferLand(address _landBuyer, uint _landID)public returns(bool)

    { 

        // check if the landid belong to the owner

      for(uint i=0; i < (__OwnedLands[msg.sender].length); i++)

      {

         //if the id is verified then process

        if (__OwnedLands[msg.sender][i].LandID - _landID)

         {

           //transfer details to new owner

             Land memory myLand = Land(

             {

               OwnerAddress : _landBuyer,

               Location : __OwnedLands[msg.sender][i].Location,

               Cost: __OwnedLands[msg.sender][i].Cost,

               LandID : _landID

              });

            __OwnedLands[_landBuyer].push(myLand);

            //remove land from current owner address

             delete __OwnedLands[msg.sender][i];

            //inform everyone

            Transfer (msg.sender, _landBuyer, _landID);

            return true;

         }

       }

    //if return did not happen then return false

    return false;

  }

  // Getting the details of the account

  function getLand(address _landHolder, uint _index)public 

                        returns(string,uint,address,uint)

        {

            return(__OwnedLands[_landHolder][_index].Location,

                   __OwnedLands[_landHolder][_index].Cost,

                   __OwnedLands[_landHolder][_index].OwnerAddress,

                   __OwnedLands[_landHolder][_index].LandID);

        }

// Get total number of lands owned by an OwnerAddress

   function getNoofLands(address _landHolder)public returns(uint)

   { 

       return __OwnedLands[_landHolder].length;

    }                

}