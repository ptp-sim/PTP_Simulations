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

package simulations.Testbenches.EncapTest;

import libptp.Hardware.*.*;
import libptp.Testbenches.*.*;

network EncapkTestNetwork
{
    submodules:

        Encap1: PTP_EtherEncap {
            @display("p=88,183");
        }

        Encap2: PTP_EtherEncap {
            @display("p=340,183");
        }

        encapTest: EncapTest {
            @display("p=217,40");
        }

    connections allowunconnected:

        encapTest.upperLayerOut --> Encap1.upperLayerIn;
        Encap1.lowerLayerOut --> Encap2.lowerLayerIn;
        Encap2.upperLayerOut --> encapTest.upperLayerIn;
}
