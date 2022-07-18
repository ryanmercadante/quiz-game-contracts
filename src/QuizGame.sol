// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract QuizGame {
    bytes32 public salt = bytes32("123123123");
    bytes32 public hashedAnswer;
    string public question;

    constructor(string memory _question, bytes32 _hashedAnswer) {
        question = _question;
        hashedAnswer = _hashedAnswer;
    }

    function guess(string calldata answer) public {
        bytes32 hashedGuessedAnswer = keccak256(abi.encodePacked(salt, answer));
        require(hashedGuessedAnswer == hashedAnswer, "wrong answer");
        if (address(this).balance > 0) {
            payable(msg.sender).transfer(address(this).balance);
        }
    }

    fallback() external payable {}

    receive() external payable {}
}
