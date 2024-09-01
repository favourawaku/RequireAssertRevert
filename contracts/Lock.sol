// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GuessAndWin{

    uint winningNumber =5;

    struct Person{
        address addr;
        uint guess;
        bool guessed;
    }

    mapping (address => Person) guessers;

   
    function guess(uint _num) public {
        Person storage person = guessers[msg.sender];
        require( !person.guessed, "You have Already guessed");
        person.guess = _num;
        person.guessed = true;

    }

    function checkResult() public view returns(string memory){
        Person storage person = guessers[msg.sender];
        if(!person. guessed){
            revert("You have not guessed");
        }
        assert(person.guess != 0);

        if(person.guess == winningNumber){
        return("Congratulations you win");
        }
        else{
            revert("Wrong Number");
        }

    }
}
