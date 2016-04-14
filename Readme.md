
PTP Simulations: Examle simulations for LibPTP
===============================

Project description
-------------------------------

This repository provides exmaple simulations using [LibPTP][1] library for the simulation of the Precision Time Protocol (PTP) as specified in IEEE 1588-2008.
The current version of this software can be found on the [author's Github site][2].
The example networks provided in this repository are the ones that were used for my master thesis:

* _Wolfgang Wallner_, __Simulation of Time-synchronized Networks using IEEE 1588-2008__, 2016, Vienna University of Technology

[1]: https://github.com/w-wallner/LibPTP
[2]: https://github.com/w-wallner/PTP_Simulations

Reposity contents:
---------------------

Mostly files below the _simulatons_ are of interest.
The _simulations/PTP_ directoy contains different PTP simulation networks:

* __BMC_Tests:__ Diffent test cases for the Best Master Clock Algorithm. The test cases were taken from the Book _Measurement, Control, and Communication Using IEEE 1588_ by John Eidson.
* __DaisyChain:__ A daisy chain network. Useful for studying the impact of line length on the clock synchronization.
* __Mixed_Test_1__, __Mixed_Test_2__, __Mixed_Test_3__: Networks with a mix of different PTP nodes.
* __Ring:__ A ring network.
* __Simple:__ The most simple PTP use case: a master capable clock and a slave-only node.
* __SingleMaster:__ A network with a single PTP node. The main purpose for this test network is to catch regressions in the source code.
* __TC_Test:__ A simple network with transparent clocks. This example also servers mainly for regression testing.

The _simulations/Testbenches_ directoy contains various test benches to verify the correct functions of my LibPTP simulation models.

License
---------------------

This project is licensed unter the GPLv3. See the COPYING file for details.

Contact
---------------------

wolfgang-wallner [AT] gmx.at
