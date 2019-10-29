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

package simulations.Testbenches.PtpEthMapTest;

import inet.base.Sink;

import libptp.Software.*.*;
import libptp.Firmware.*.*;
import libptp.Hardware.*.*;
import libptp.Testbenches.*.*;

network PtpEthMapTest
{
    submodules:

        ptpFrameGen: PtpFrameGen {

            parameters:

                @display("p=74,167");

                PTP_TwoStepFlag = true;
        }

        PTP_EthMap: PTP_EthernetMapping {

            parameters:
                @display("p=225,167");

            gates:
                upperLayerIn[1];
                upperLayerOut[1];
        }

        sink: Sink {
            @display("p=381,167");

            gates:
                in[1];
        }
    connections allowunconnected:

        ptpFrameGen.PtpOut --> PTP_EthMap.upperLayerIn[0];
        PTP_EthMap.lowerLayerOut --> sink.in[0];
}
