// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/QuizFactory.sol";

contract QuizFactoryTest is Test {
    QuizFactory public factory;
    bytes32 salt = bytes32("123123123");

    function setUp() public {
        factory = new QuizFactory();
    }

    function testCreateQuiz() public {
        string memory question = "What is the answer to life?";
        string memory answer = "42";
        bytes32 hashedAnswer = keccak256(abi.encodePacked(salt, answer));

        factory.createQuiz(question, hashedAnswer);
        QuizGame quiz = factory.quizzes(0);
        assertEq(
            keccak256(abi.encodePacked(quiz.question())),
            keccak256(abi.encodePacked(question))
        );
    }

    function testCountQuizzes() public {
        string memory question = "What is the answer to life?";
        string memory answer = "42";
        bytes32 hashedAnswer = keccak256(abi.encodePacked(salt, answer));
        factory.createQuiz(question, hashedAnswer);
        factory.createQuiz(question, hashedAnswer);
        QuizGame[] memory quizzes = factory.getQuizzes();
        assertEq(quizzes.length, 2);
    }
}
