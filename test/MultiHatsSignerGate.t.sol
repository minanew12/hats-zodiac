// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./HSGTestSetup.t.sol";

contract MultiHatsSignerGateTest is HSGTestSetup {
// function testAddSingleSigner() public {
//     addSigners(1);

//     assertEq(safe.getOwners().length, 1);
//     assertEq(hatsSignerGate.signerCount(), 1);
//     assertEq(safe.getOwners()[0], addresses[0]);
//     assertEq(safe.getThreshold(), 1);
// }

// function testAddThreeSigners() public {
//     addSigners(3);

//     assertEq(hatsSignerGate.signerCount(), 3);
//     assertEq(safe.getOwners()[0], addresses[2]);
//     assertEq(safe.getOwners()[1], addresses[1]);
//     assertEq(safe.getOwners()[2], addresses[0]);
//     assertEq(safe.getThreshold(), 2);
// }

// function testAddTooManySigners() public {
//     addSigners(5);

//     mockIsWearerCall(addresses[5], signerHat, true);

//     vm.expectRevert(MaxSignersReached.selector);
//     vm.prank(addresses[5]);

//     // this call should fail
//     hatsSignerGate.claimSigner();

//     assertEq(hatsSignerGate.signerCount(), 5);
//     assertEq(safe.getOwners()[0], addresses[4]);
//     assertEq(safe.getOwners()[1], addresses[3]);
//     assertEq(safe.getOwners()[2], addresses[2]);
//     assertEq(safe.getOwners()[3], addresses[1]);
//     assertEq(safe.getOwners()[4], addresses[0]);
//     assertEq(safe.getThreshold(), 2);
// }

// function testClaimSigner() public {
//     mockIsWearerCall(addresses[3], signerHat, true);

//     vm.prank(addresses[3]);
//     hatsSignerGate.claimSigner();

//     assertEq(safe.getOwners()[0], addresses[3]);
//     assertEq(safe.getThreshold(), 1);
//     assertEq(safe.getOwners().length, 1);
// }

// function testOwnerClaimSignerReverts() public {
//     addSigners(2);

//     vm.prank(addresses[1]);

//     vm.expectRevert(abi.encodeWithSelector(SignerAlreadyClaimed.selector, addresses[1]));

//     hatsSignerGate.claimSigner();

//     assertEq(hatsSignerGate.signerCount(), 2);
// }

// function testNonHatWearerCannotClaimSigner() public {
//     mockIsWearerCall(addresses[3], signerHat, false);

//     vm.prank(addresses[3]);

//     vm.expectRevert(abi.encodeWithSelector(NotSignerHatWearer.selector, addresses[3]));
//     hatsSignerGate.claimSigner();
// }

// function testCanRemoveInvalidSigner1() public {
//     addSigners(1);

//     mockIsWearerCall(addresses[0], signerHat, false);

//     hatsSignerGate.removeSigner(addresses[0]);

//     assertEq(safe.getOwners().length, 1);
//     assertEq(safe.getOwners()[0], address(hatsSignerGate));
//     assertEq(hatsSignerGate.signerCount(), 0);
//     assertEq(safe.getThreshold(), 1);
// }

// function testCanRemoveInvalidSignerWhenMultipleSigners() public {
//     addSigners(2);

//     mockIsWearerCall(addresses[0], signerHat, false);

//     emit log_uint(hatsSignerGate.signerCount());

//     hatsSignerGate.removeSigner(addresses[0]);

//     assertEq(safe.getOwners().length, 1);
//     assertEq(safe.getOwners()[0], addresses[1]);
//     assertEq(hatsSignerGate.signerCount(), 1);

//     assertEq(safe.getThreshold(), 1);
// }

// function testCanRemoveInvalidSignerAfterReconcile2Signers() public {
//     addSigners(2);

//     mockIsWearerCall(addresses[0], signerHat, false);

//     hatsSignerGate.reconcileSignerCount();
//     assertEq(hatsSignerGate.signerCount(), 1);

//     hatsSignerGate.removeSigner(addresses[0]);

//     assertEq(safe.getOwners().length, 1);
//     assertEq(safe.getOwners()[0], addresses[1]);
//     assertEq(hatsSignerGate.signerCount(), 1);

//     assertEq(safe.getThreshold(), 1);
// }

// function testCanRemoveInvalidSignerAfterReconcile3PLusSigners() public {
//     addSigners(3);

//     mockIsWearerCall(addresses[0], signerHat, false);

//     hatsSignerGate.reconcileSignerCount();
//     assertEq(hatsSignerGate.signerCount(), 2);

//     hatsSignerGate.removeSigner(addresses[0]);

//     assertEq(safe.getOwners().length, 2);
//     assertEq(safe.getOwners()[0], addresses[2]);
//     assertEq(safe.getOwners()[1], addresses[1]);
//     assertEq(hatsSignerGate.signerCount(), 2);

//     assertEq(safe.getThreshold(), 2);
// }

// function testCannotRemoveValidSigner() public {
//     addSigners(1);

//     mockIsWearerCall(addresses[0], signerHat, true);

//     vm.expectRevert(abi.encodeWithSelector(StillWearsSignerHat.selector, addresses[0]));

//     hatsSignerGate.removeSigner(addresses[0]);

//     assertEq(safe.getOwners().length, 1);
//     assertEq(safe.getOwners()[0], addresses[0]);
//     assertEq(hatsSignerGate.signerCount(), 1);

//     assertEq(safe.getThreshold(), 1);
// }

// function testExecTxByHatWearers() public {
//     addSigners(3);

//     uint256 preNonce = safe.nonce();
//     uint256 preValue = 1 ether;
//     uint256 transferValue = 0.2 ether;
//     uint256 postValue = preValue - transferValue;
//     address destAddress = addresses[3];
//     // give the safe some eth
//     hoax(address(safe), preValue);

//     // create the tx
//     bytes32 txHash = getTxHash(destAddress, transferValue, hex"00", safe);

//     // have 3 signers sign it
//     bytes memory signatures = createNSigsForTx(txHash, 3);

//     // have one of the signers submit/exec the tx
//     vm.prank(addresses[0]);
//     safe.execTransaction(
//         destAddress,
//         transferValue,
//         hex"00",
//         Enum.Operation.Call,
//         // not using the refunder
//         0,
//         0,
//         0,
//         address(0),
//         payable(address(0)),
//         signatures
//     );
//     // confirm it we executed by checking ETH balance changes
//     assertEq(address(safe).balance, postValue);
//     assertEq(destAddress.balance, transferValue);
//     assertEq(safe.nonce(), preNonce + 1);
//     emit log_uint(address(safe).balance);
// }

// function testExecTxByNonHatWearersReverts() public {
//     addSigners(3);

//     uint256 preNonce = safe.nonce();
//     uint256 preValue = 1 ether;
//     uint256 transferValue = 0.2 ether;
//     // uint256 postValue = preValue - transferValue;
//     address destAddress = addresses[3];
//     // give the safe some eth
//     hoax(address(safe), preValue);
//     // emit log_uint(address(safe).balance);
//     // create tx to send some eth from safe to wherever
//     // create the tx
//     bytes32 txHash = getTxHash(destAddress, transferValue, hex"00", safe);

//     // have 3 signers sign it
//     bytes memory signatures = createNSigsForTx(txHash, 3);

//     // removing the hats from 2 signers
//     mockIsWearerCall(addresses[0], signerHat, false);
//     mockIsWearerCall(addresses[1], signerHat, false);

//     // emit log_uint(address(safe).balance);
//     // have one of the signers submit/exec the tx
//     vm.prank(addresses[0]);

//     vm.expectRevert(InvalidSigners.selector);

//     safe.execTransaction(
//         destAddress,
//         transferValue,
//         hex"00",
//         Enum.Operation.Call,
//         // not using the refunder
//         0,
//         0,
//         0,
//         address(0),
//         payable(address(0)),
//         signatures
//     );

//     // confirm it was not executed by checking ETH balance changes
//     // assertEq(address(safe).balance, preValue); // FIXME something weird is going on with vm.hoax();
//     assertEq(destAddress.balance, 0);
//     assertEq(safe.nonce(), preNonce);
// }

// function testExecTxByTooFewOwnersReverts() public {
//     // add a legit signer
//     addSigners(1);

//     // set up test values
//     uint256 preNonce = safe.nonce();
//     uint256 preValue = 1 ether;
//     uint256 transferValue = 0.2 ether;
//     // uint256 postValue = preValue - transferValue;
//     address destAddress = addresses[3];
//     // give the safe some eth
//     hoax(address(safe), preValue);

//     // have the remaining signer sign it
//     // create the tx
//     bytes32 txHash = getTxHash(destAddress, transferValue, hex"00", safe);

//     // have them sign it
//     bytes memory signatures = createNSigsForTx(txHash, 1);

//     // have the legit signer exec the tx
//     vm.prank(addresses[0]);

//     mockIsWearerCall(addresses[0], signerHat, true);

//     vm.expectRevert(
//         abi.encodeWithSelector(BelowMinThreshold.selector, hatsSignerGate.minThreshold(), safe.getOwners().length)
//     );

//     safe.execTransaction(
//         destAddress,
//         transferValue,
//         hex"00",
//         Enum.Operation.Call,
//         // not using the refunder
//         0,
//         0,
//         0,
//         address(0),
//         payable(address(0)),
//         signatures
//     );

//     // confirm it was not executed by checking ETH balance changes
//     // assertEq(address(safe).balance, preValue); // FIXME something weird is going on with vm.hoax();
//     assertEq(destAddress.balance, 0);
//     assertEq(safe.nonce(), preNonce);
//     emit log_uint(address(safe).balance);
// }
}
