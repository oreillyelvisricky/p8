// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import { Layer as LayerLib } from "./libraries/Layer.sol";

contract Wallet {
  using LayerLib for LayerLib.LayerAPI;


  struct AmountMinMax {
    uint256 min;
    uint256 max;
  }

  struct Layer {
    AmountMinMax amount;

    uint numTokens;
    mapping (uint => string) tokens;

    mapping (uint => LayerLib.LayerAPI) layerFlow;
  }

  mapping (uint => mapping (uint => Layer)) TransferLayers;

  struct Transfer {
    uint256 transferNum;
    address receiver;
    uint256 amount;

    uint transferLayersIndex;

    bool executed;
  }

  uint numTransfers;
  mapping (uint => Transfer) transferQueue;

  function test(address receiver) public virtual {
    // Set layer requirements for ALL transfers
    // Differences exist in the layers
    testSetTransferLayers();

    testCreateTransfer(receiver);

    logTransferQueue();
  }

  function testSetTransferLayers() private {
    Layer storage layerA = TransferLayers[0][0];

    AmountMinMax memory amountA = AmountMinMax({
      min: 0,
      max: 100
    });

    layerA.amount = amountA;

    layerA.tokens[layerA.numTokens] = "ETH";
    layerA.numTokens++;

    //
  }

  function testCreateTransfer(address receiver) private {
    Transfer memory transfer = Transfer({
      transferNum: numTransfers,
      receiver: receiver,
      amount: 100,

      transferLayersIndex: numTransfers,

      executed: false
    });

    transferQueue[numTransfers] = transfer;

    numTransfers++;
  }

  function logTransferQueue() {
    //
  }
}
