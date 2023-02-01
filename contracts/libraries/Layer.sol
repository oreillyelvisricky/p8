// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

library Layer {
  struct LayerAPI {
    bool isSeqSep;

    bool started;
    bool success;
    bool failure;
  }

  function init(
    LayerAPI memory self
  ) internal pure returns (Layer.LayerAPI memory) {
    self.started = true;
    return self;
  }
}
