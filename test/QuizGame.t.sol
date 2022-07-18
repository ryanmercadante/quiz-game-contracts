// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/QuizGame.sol";

contract QuizGameTest is Test {
    QuizGame public game;

    function setUp() public {
        // Create a question
        string memory question = "What is the answer to life?";
        string memory answer = "42";
        bytes32 salt = bytes32("123123123");
        bytes32 hashedAnswer = keccak256(abi.encodePacked(salt, answer));
        emit log_bytes32(hashedAnswer);

        game = new QuizGame(question, hashedAnswer);
        emit log(game.question());
    }

    function testExample() public {
        assertTrue(true);
    }
}
