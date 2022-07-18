// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/QuizFactory.sol";

contract QuizFactoryTest is Test {
    QuizFactory public factory;

    function setUp() public {
        factory = new QuizFactory();
    }
}
