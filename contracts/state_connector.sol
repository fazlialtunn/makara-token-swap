// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IStateConnector {
    // Define a function signature for requesting a state proof from Flare's State Connector
    function requestStateProof(
        uint16 attestationType, 
        uint32 sourceId, 
        bytes32 messageIntegrityCode, 
        bytes32 id, 
        uint32 blockNumber, 
        bytes32 sourceAddressIndicator
    ) external returns (bytes32 requestID);

    // Define a function signature for retrieving the state proof result
    function getStateProofResult(bytes32 requestID) external view returns (
        uint64 blockNumber, 
        uint64 blockTimestamp, 
        bytes32 transactionHash, 
        bytes32 sourceAddressIndicator, 
        bytes32 sourceAddressHash, 
        int256 spentAmount, 
        bytes32 paymentReference
    );
}

contract BalanceDecreasingTransactionChecker {
    IStateConnector public stateConnector;

    constructor(address _stateConnectorAddress) {
        stateConnector = IStateConnector(_stateConnectorAddress);
    }

    // Function to request a balance decreasing transaction proof
    function requestBalanceDecreasingTransactionProof(
        uint32 sourceId, // The ID of the underlying chain
        bytes32 messageIntegrityCode, // The MIC for the transaction
        bytes32 id, // Transaction hash
        uint32 blockNumber, // Block number of the transaction
        bytes32 sourceAddressIndicator // Source address or indicator
    ) public {
        // AttestationType for BalanceDecreasingTransaction, assuming an enum or constant is defined elsewhere
        uint16 attestationType = 2;

        // Request a state proof from the State Connector
        bytes32 requestID = stateConnector.requestStateProof(
            attestationType, 
            sourceId, 
            messageIntegrityCode, 
            id, 
            blockNumber, 
            sourceAddressIndicator
        );

        // At this point, you can store the requestID and later use it to retrieve the result
        // or trigger another contract function to handle the proof result.
    }

    // Example function to retrieve and process the state proof result
    function processStateProofResult(bytes32 requestID) public {
        // Retrieve the result from the State Connector using the requestID
        (
            uint64 blockNumber, 
            uint64 blockTimestamp, 
            bytes32 transactionHash, 
            bytes32 sourceAddressIndicator, 
            bytes32 sourceAddressHash, 
            int256 spentAmount, 
            bytes32 paymentReference
        ) = stateConnector.getStateProofResult(requestID);

        // Implement your logic to handle the proof result here
        // For example, verifying the spentAmount to confirm it's a balance decreasing transaction
    }
}
