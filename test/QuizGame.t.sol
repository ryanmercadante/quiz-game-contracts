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

        game = new QuizGame(question, hashedAnswer);
    }

    function testQuizFail() public {
        try game.guess("1") {
            assertTrue(false);
        } catch {
            assertTrue(true);
        }
    }

    function testQuizPass() public {
        uint256 beginBalance = address(this).balance;
        // Set game contract with 1 ether balance
        deal(address(game), 1 ether);
        game.guess("42");
        assertEq(address(this).balance, beginBalance + 1 ether);
    }

    fallback() external payable {}

    receive() external payable {}
}
