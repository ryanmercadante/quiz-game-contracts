// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract QuizGame {
    bytes32 public salt = bytes32("123321123");
    bytes32 public hashedAnswer;
    string public question;

    constructor(string memory _question, bytes32 _hashedAnswer) {
        question = _question;
        hashedAnswer = _hashedAnswer;
    }
}
