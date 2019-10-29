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

package simulations.Testbenches.LLC_Test;

import inet.base.Sink;

import libptp.Software.*.*;
import libptp.Firmware.*.*;
import libptp.Hardware.*.*;
import libptp.Testbenches.*.*;

import inet.applications.ethernet.EtherAppCli;

network LLC_Test
{
    submodules:

        babblingIP: BabblingIP {
            @display("p=67,50");
        }

        PTP_FrameGen: PtpFrameGen {

            parameters:

                @display("p=194,50");

        }

        PTP_EthMap: PTP_EthernetMapping {

            parameters:
                @display("p=194,171");

            gates:
                upperLayerIn[1];
                upperLayerOut[1];
        }

        LLC1: EthernetII_LLC {
            parameters:
                @display("p=131,301");

            gates:
                upperLayerOut[2];
                upperLayerIn[2];
        }

        LLC2: EthernetII_LLC {
            parameters:
                @display("p=370,301");

                EtherTypeMapping = ( "35063:0" );

            gates:
                upperLayerOut[1];
                upperLayerIn[1];
        }

        PTP_Sink: Sink {
            @display("p=370,50");

            gates:
                in[1];
        }

    connections allowunconnected:

        babblingIP.IpOut --> LLC1.upperLayerIn[0];

        PTP_FrameGen.PtpOut --> PTP_EthMap.upperLayerIn[0];
        PTP_EthMap.lowerLayerOut --> LLC1.upperLayerIn[1];

        LLC1.lowerLayerOut --> LLC2.lowerLayerIn;

        LLC2.upperLayerOut[0] --> PTP_Sink.in[0];
}
