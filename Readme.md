
PTP Simulations: Example simulations for LibPTP
===============================

Project relationship
-------------------------------

This project is part of the **ptp-sim** project.
See the [ptp-sim project page](https://ptp-sim.github.io/) for more information.
There is also the [ptp-sim discussion forum](http://ptp-sim.boards.net) for further discussions.

Project description
-------------------------------

This repository provides exmaple simulations using the [LibPTP][1] library for the simulation of the Precision Time Protocol (PTP) as specified in IEEE 1588-2008.
The current version of this software can be found on the [projects's Github site][2].
The example networks provided in this repository are the ones that were used in the following master thesis:

* _Wolfgang Wallner_, __Simulation of Time-synchronized Networks using IEEE 1588-2008__, 2016, Vienna University of Technology
Persistent URL: https://resolver.obvsg.at/urn:nbn:at:at-ubtuw:1-3908

[1]: https://github.com/ptp-sim/libPTP
[2]: https://github.com/ptp-sim/PTP_Simulations

Reposity contents:
---------------------

Mostly the files below the _simulatons_ folder are of interest.
The _simulations/PTP_ directoy contains different PTP simulation networks:

* __BMC_Tests:__ Diffent test cases for the Best Master Clock Algorithm (BMCA). The test cases were taken from the Book _Measurement, Control, and Communication Using IEEE 1588_ by John Eidson (ISBN 978-1-84628-251-5).
* __DaisyChain:__ A daisy chain network. This example is useful for studying the impact of the line length on the clock synchronization.
* __Mixed_Test_1__, __Mixed_Test_2__, __Mixed_Test_3__: Example networks with a mix of different PTP nodes.
* __Ring:__ A ring network.
* __Simple:__ The most simple PTP use case: a master-capable clock and a slave-only node.
* __SingleMaster:__ A network with a single PTP node. The main purpose for this test network is to catch regressions in the source code.
* __TC_Test:__ A simple network with transparent clocks. This example also servers mainly for regression testing.

The _simulations/Testbenches_ directory contains various test benches to test different LibPTP simulation models.

License
---------------------

This project is licensed unter the GPLv3. See the COPYING file for details.

Contact
---------------------

Please visit the [ptp-sim discussion forum](http://ptp-sim.boards.net) for further discussions.
