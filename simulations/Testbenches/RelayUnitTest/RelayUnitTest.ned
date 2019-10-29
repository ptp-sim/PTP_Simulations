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

package simulations.Testbenches.RelayUnitTest;

import libptp.Software.*.*;
import libptp.Firmware.*.*;
import libptp.Hardware.*.*;
import libptp.Testbenches.*.*;

import inet.base.Sink;
import inet.applications.ethernet.EtherAppCli;
import inet.linklayer.IMACRelayUnit;
import inet.linklayer.IMACAddressTable;

network RelayUnitTest
{
    parameters:

        string macTableType = default("MACAddressTable"); // type of the ~IMACAddressTable

        int LeftPortIdx = 2;
        int RightPortIdx = 0;
        int LocalPortIdx = 1;

    submodules:

        // --------------------------------------------------------------
        // Local node
        // --------------------------------------------------------------

        LocalBabblingIP: BabblingIP {
            @display("p=294,41");
        }

        LocalFrameGen: PtpFrameGen {

            parameters:

                @display("p=397,41");

                PortNumber = 2;

                TestSchedule = default(" 10.7, TEST_SEND_PTP_PDELAY_REQ,    \
                                         11.7, TEST_SEND_PTP_ANNOUNCE,      \
                                         20.7, TEST_SEND_PTP_SYNC,          \
                                         21.7, TEST_SEND_PTP_SYNC,          \
                                         30.7, TEST_SEND_PTP_FOLLOW_UP,     \
                                         31.7, TEST_SEND_PTP_FOLLOW_UP,     \
                                         40.7, TEST_SEND_PTP_DELAY_REQ,     \
                                         41.7, TEST_SEND_PTP_DELAY_REQ,     \
                                         50.7, TEST_SEND_PTP_PDELAY_REQ,    \
                                         51.7, TEST_SEND_PTP_PDELAY_REQ,    \
                                         ");

        }

        LocalEthMap: PTP_EthernetMapping {

            parameters:
                @display("p=397,173");

            gates:
                upperLayerIn[1];
                upperLayerOut[1];
        }

        LocalLLC: EthernetII_LLC {
            parameters:
                @display("p=323,275");

            gates:
                upperLayerIn[2];
                upperLayerOut[2];
        }

        LocalEncap: PTP_EtherEncap {
            @display("p=323,363");
        }

        LocalSink: Sink {
            @display("p=323,553");

            gates:
                in[1];
        }

        relayUnit: PTP_MACRelayUnit {
            parameters:
                @display("p=323,465");

                PTP_ClockType = default("PTP_CLOCK_TYPE_TRANSPARENT");
                internalPort = LocalPortIdx;

            gates:
                ifIn[3];
                ifOut[3];
        }

        macTable: <macTableType> like IMACAddressTable {
            @display("p=428,465;is=s");
        }

        // --------------------------------------------------------------
        // Remote node 1
        // --------------------------------------------------------------

        RemoteFrameGen_1: PtpFrameGen {

            parameters:

                @display("p=80,41");

                TestSchedule = default(" 10.7, TEST_SEND_PTP_ANNOUNCE,      \
                                         11.7, TEST_SEND_PTP_ANNOUNCE,      \
                                         20.7, TEST_SEND_PTP_SYNC,          \
                                         21.7, TEST_SEND_PTP_SYNC,          \
                                         30.7, TEST_SEND_PTP_FOLLOW_UP,     \
                                         31.7, TEST_SEND_PTP_FOLLOW_UP,     \
                                         40.7, TEST_SEND_PTP_DELAY_REQ,     \
                                         41.7, TEST_SEND_PTP_DELAY_REQ,     \
                                         50.7, TEST_SEND_PTP_PDELAY_REQ,    \
                                         51.7, TEST_SEND_PTP_PDELAY_REQ,    \
                                         ");
        }

        RemoteEthMap_1: PTP_EthernetMapping {

            parameters:
                @display("p=80,173");

            gates:
                upperLayerIn[1];
                upperLayerOut[1];
        }

        RemoteEncap_1: PTP_EtherEncap {
            @display("p=80,363");
        }

        RemoteSink_1: Sink {
            @display("p=80,553");

            gates:
                in[1];
        }

        // --------------------------------------------------------------
        // Remote node 2
        // --------------------------------------------------------------

        RemoteFrameGen_2: PtpFrameGen {

            parameters:

                @display("p=589,41");

                TestSchedule = default(" 10.5, TEST_SEND_PTP_ANNOUNCE,      \
                                         11.5, TEST_SEND_PTP_ANNOUNCE,      \
                                         20.5, TEST_SEND_PTP_SYNC,          \
                                         21.5, TEST_SEND_PTP_SYNC,          \
                                         30.5, TEST_SEND_PTP_FOLLOW_UP,     \
                                         31.5, TEST_SEND_PTP_FOLLOW_UP,     \
                                         40.5, TEST_SEND_PTP_DELAY_REQ,     \
                                         41.5, TEST_SEND_PTP_DELAY_REQ,     \
                                         50.5, TEST_SEND_PTP_PDELAY_REQ,    \
                                         51.5, TEST_SEND_PTP_PDELAY_REQ,    \
                                      ");
        }

        RemoteEthMap_2: PTP_EthernetMapping {

            parameters:
                @display("p=589,173");

            gates:
                upperLayerIn[1];
                upperLayerOut[1];
        }

        RemoteEncap_2: PTP_EtherEncap {
            @display("p=589,363");
        }

        RemoteSink_2: Sink {
            @display("p=589,553");

            gates:
                in[1];
        }

    connections allowunconnected:

        RemoteFrameGen_1.PtpOut --> RemoteEthMap_1.upperLayerIn[0];
        RemoteEthMap_1.lowerLayerOut --> RemoteEncap_1.upperLayerIn;
        RemoteEncap_1.lowerLayerOut --> relayUnit.ifIn[LeftPortIdx];

        RemoteFrameGen_2.PtpOut --> RemoteEthMap_2.upperLayerIn[0];
        RemoteEthMap_2.lowerLayerOut --> RemoteEncap_2.upperLayerIn;
        RemoteEncap_2.lowerLayerOut --> relayUnit.ifIn[RightPortIdx];

        LocalBabblingIP.IpOut --> LocalLLC.upperLayerIn[0];
        LocalFrameGen.PtpOut --> LocalEthMap.upperLayerIn[0];
        LocalEthMap.lowerLayerOut --> LocalLLC.upperLayerIn[1];
        LocalLLC.lowerLayerOut --> LocalEncap.upperLayerIn;
        LocalEncap.lowerLayerOut --> relayUnit.ifIn[LocalPortIdx];

        relayUnit.ifOut[LocalPortIdx] --> LocalSink.in[0];
        relayUnit.ifOut[LeftPortIdx] --> RemoteSink_1.in[0];
        relayUnit.ifOut[RightPortIdx] --> RemoteSink_2.in[0];
}
