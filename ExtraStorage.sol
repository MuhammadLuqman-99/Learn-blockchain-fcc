//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

// is ialah digunakan untk cnth contract skrg ialah child(contract tmbhn) kpd contract sblm ni.
// jadi ia still cuma function sama mcm sblm ni and blh buat tmbhn di sini.
contract ExtraStorage is SimpleStorage {

    //ni conth kalau kita nak tkr function sblm ni atau tmbh sesuatu dkt function yg sama
    // cnth nak buat +5 ke semua nmbr baru
    // overrride
    //override, virtual
    // kalau kita nak dia overrride function sblm ni kena ltk override
    // tapi syarat dia dkt contract yg fucntion sama sblm ni kena letak virtual
    // => tgk di SimpleContract line 21
    function store(uint256 _favoriteNumber) public override{
        favoriteNumber = _favoriteNumber +5;
    }
}