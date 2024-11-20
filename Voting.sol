// SPDX-License-Identifier: MIT
pragma solidity ^0.4.23;

contract Voting {

    bytes32[] public candidateList;
    mapping (bytes32 => uint8) public votesReceived;

    // constructor
    constructor(bytes32[] candidateNames) public {
        candidateList = candidateNames;
    }

    // vote
    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate] += 1;
    }

    // count
    function totalVotesFor(bytes32 candidate) public view returns (uint8){
        require(validCandidate(candidate));
        return votesReceived[candidate];
    }

    // validate
    function validCandidate(bytes32 candidate) public view returns(bool) {
        for (uint i=0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }

        return false;
    }
}