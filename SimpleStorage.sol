// I'm a comment!
// Yellow ! = warning
// red ! = problem and code not compile
//EVM = ethereum virtual machine
// cnth evm lain avalanche, Fantom, polygon
// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;
//pragma solidity ^0.8.7 makanya kita nak guna yang atas dari tu
//pragma solidity >=0.8.7 <0.8.9 kita nak guna antara 2 version ni

contract SimpleStorage {
    // boolean, uint ,int ,bytes, address
    /*  bool hasFavoriteNumber = true;
    uint256 favoriteNumber = 5;
    string favoriteNumberInText = "Five";
    bytes32 favoriteNumberBytes = "cat";
    int favoriteNumberInt = -5;
    address myAddress = 0x2AcB02571562bEf81C8B8162EB6D1bB8aEE1Ba80; */

    bool hasFavoriteNumber = true;

    //kalau kita x bagitau dia berapa dia akan mula dari 0
    uint256 public favoriteNumber;

    // contoh kalau kita lupa fav nmbr dia so kita Bblh guna kaedah mapping
    mapping( string => uint256) public nameToFavorateNumber;

    //contoh kalau kita nak letak banyak lagi data or dlm prob skrg orang so blh pakai
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // ni untk arry banyak org smbbg ke function add people
    People[] public people;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;

        // contoh kita panggil dkt sini
        retrieve();
    }

    //view, pure x guna gas kalau guna sbb dia just reading so x beri kesan ke blockchain kalau
        // modify baru kena bayar gas
    // kecuali kita panggil reading fuction tapi dlm fuction yg dimodify yg tu kena bayar gas
        // tgk line 25 ->
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }
    
    // evm can access and store information in 6 place :
    //stack, memory, storage, calldata, code, logs.
    // function untk arry
    function addPerson(string memory _name, uint _favoriteNumber) public {
        //People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        //people.push(newPerson);
        people.push(People(_favoriteNumber, _name));
        nameToFavorateNumber[_name] = _favoriteNumber ;
    }
}

// 0xd9145CCE52D386f254917e481eB44e9943F39138
