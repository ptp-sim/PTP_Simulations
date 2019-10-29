// ============================================================================
//
// Copyright 2015 Wolfgang Wallner (wolfgang-wallner AT gmx.at)
//
// This file is part of the PTP Simulations project.
//
// The PTP Simulations project is free software: you can redistribute it
// and/or modify it under the terms of the GNU General Public License as
// published by the Free Software Foundation, either version 3 of the License,
// or (at your option) any later version.
//
// The PTP Simulations project is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License.com for more details.
//
// You should have received a copy of the GNU General Public License.com
// along with The PTP Simulations project.
// If not, see <http://www.gnu.org/licenses/>.
//
// ============================================================================

package simulations.Testbenches.EtherPhyTest;

import libptp.Hardware.EtherPhy.EtherPhy;
import libptp.Testbenches.EtherPhyTester.EtherPhyTester;

network EtherPhyTest
{
    parameters:

    submodules:

        TxTester: EtherPhyTester {
            @display("p=191,36");
        }
        RxTester: EtherPhyTester {
            @display("p=67,36");
        }
        DUT: EtherPhy {
            @display("p=132,136");
        }

    connections allowunconnected:

        TxTester.TestGate$o --> DUT.mii$i;
        DUT.phy$o --> TxTester.TestGate$i;

        RxTester.TestGate$o --> DUT.phy$i;
        DUT.mii$o --> RxTester.TestGate$i;
}
