# GuessAndWin Smart Contract

## Summary
The `GuessAndWin smart` contract is designed as a simple game where participants can guess a predefined number and win if their guess matches the winning number. This contract provides a foundational implementation for developing decentralized gaming applications on the Ethereum blockchain, offering a basic understanding of managing user interactions and validating inputs in a secure and transparent manner.

## Description
The `GuessAndWin` contract allows participants to submit a guess for a predefined winning number. If the guessed number matches the winning number, the contract returns a success message. The contract tracks each participant's guess to ensure that they can only guess once. This contract serves as a simple example for understanding how to build a guessing game on the blockchain, with potential extensions to more complex scenarios.

## Getting Started


### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., guessAndWin.sol). Copy and paste the following code into the file:

```javascript
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
```

### Deployment

To deploy the `GuessAndWin` contract, follow these steps:

1  Open Remix and paste the contract code into a new file.
2  Compile the contract using the Solidity compiler in Remix.
3  Deploy the contract on the Ethereum blockchain using the Remix deployment tools.
4  Once deployed, participants can interact with the contract by making guesses and checking results.
### Interacting with the Contract

To interact with the `DrivingSchool` contract, you can use any Ethereum development environment like [Remix](https://remix.ethereum.org/) or Hardhat.

Interacting with the Contract
To interact with the `GuessAndWin` contract, you can use any Ethereum development environment like Remix or Hardhat.

**Make a Guess:**

Participants can submit their guess using the `guess` function:


```javascript
guess(uint _num) public
```

Check the Result:

After making a guess, participants can check if they guessed the winning number using the `checkResult` function:

```javascript
checkResult() public view returns(string memory)
```
**Notes for Developers**

The winningNumber is currently hard-coded to 5. This value can be changed in the contract's code if desired.
The contract only allows each participant to guess once. This restriction can be adjusted for different game dynamics.

**Author**

Favour Sabo

**License**

This project is licensed under the MIT License.
