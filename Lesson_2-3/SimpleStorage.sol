// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; //Specify Minimum Solidity Version

contract SimpleStorage{
    // Solidity Types: boolean, uint, int, address, bytes
    // Default int in solidity is 0
    bool hasFavouriteNumber = true;
    uint favouriteNumber = 5;
    string favouriteNumberInText = "Five";
    int favouriteInt = -5;
    address myAddress = 0xAa64ce54631868Ab7D291dE3F10E0E6Fa1F7280a;
    bytes32 favouriteBytes = "cat";

    function store(uint256 _favouriteNumber) public virtual {
        favouriteNumber = _favouriteNumber;
        favouriteNumber = favouriteNumber;
    }

    //View and Pure are functions that don't cost any gas unless called inside a function which costs gas
    //They also don't allow any modification of the blockchain
    //View allows us to read any parameters which we have defined earlier
    //Pure allows only basic operations, you cannot read any parameter defined earlier
    function retrieve() public view returns(uint256){
        return favouriteNumber;
    }

    //Essentially create a new datatype consisting of primitive/ previously defined datatypes
    struct People {
        uint256 favouriteNumber;
        string name;
    }

    People public person = People({favouriteNumber: 2, name: "Pandey"});

    //Array of People
    People[] public people;

    //Function Defined to Add a Person
    //Calldata (Temporary variables that can't be modified)
    //Memory (Temporary variables that can be modified)
    //Storage(Permanent variables thaqt can be modified)
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        People memory newPerson = People(_favouriteNumber, _name);
        people.push(newPerson);
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

    //Creating a mapping (A dictionary essentially)
    mapping(string => uint256) public nameToFavouriteNumber;


}

//Contract address after deployment: 0x87301DD640aeFA2c8828eed3Db251072Edb8BFC3