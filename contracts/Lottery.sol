pragma solidity ^0.4.17;

contract Lottery {

    address public manager;
    address[] public players;

    //address[] public contracts;

    /* address public winner;

    bool public isPizzaria;

    uint public pubSpread;
    string public firstTeam;
    string public secondTeam; */
/*
    function OneTine(uint spread, string teamOne, string teamTwo) public {

      //manager = msg.sender;

        pubSpread = spread;
        firstTeam = teamOne;
        secondTeam = teamTwo;

    }
    */

     function Lottery() public {
         manager = msg.sender;
     }

    function enter() public payable {

        require(msg.value > .01 ether);

        players.push(msg.sender);

    }

    //function random() private view returns (uint) {
    //    return uint(keccak256(block.difficulty, now, players));
    //}


    function pickWinnerOne() public restricted {

        players[0].transfer(address(this).balance);
        players = new address[](0);

        //uint index = random() % players.length;
        //players[index].transfer(this.balance);

    }


    function pickWinnerTwo() public restricted {

        players[1].transfer(address(this).balance);
        players = new address[](0);

        //uint index = random() % players.length;
        //players[index].transfer(this.balance);

    }

    modifier restricted() {

        require(msg.sender == manager);
        _;

    }

    function getPlayers() public view returns (address[]) {

        return players;

    }

     //function getContracts() public view returns (address[]) {

      //return contracts;
    //}
}
/*
contract PizzeriaFactory{

    address[] public pizzeriaFactories;

    function createPizzeria(uint spread, string teamOne, string teamTwo) public returns(address newPizzeria) {
        Lottery p = new OneTine( );
        pizzeriaFactories.push(address(p));
        return address(p);

    }
}
*/
