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

package simulations.Testbenches.PTP_MAC_Test;

import libptp.Components.*.*;

import libptp.Hardware.*;
import libptp.Hardware.*.*;

import libptp.Firmware.*.*;

import libptp.Software.*.*;

import libptp.Testbenches.PtpFrameGen.PtpFrameGen;
import libptp.Testbenches.PtpMacSink.PtpMacSink;

import inet.base.Sink;
import inet.util.Delayer;

network PTP_MAC_Test_App
{
    parameters:

        string EndPoint_PTP_ClockType = default("PTP_CLOCK_TYPE_ORDINARY");
        string Switch_PTP_ClockType = default("PTP_CLOCK_TYPE_TRANSPARENT");

        bool PTP_TwoStepFlag = default(false);
        string PTP_DelayMechanism = default("DELAY_MECH_P2P");

        string SinkMAC = default("C0:FF:EE:00:00:02");

    submodules:

        FrameGen: PtpFrameGen {

            parameters:
                @display("p=122,80");

                PTP_TwoStepFlag = PTP_TwoStepFlag;

                TestSchedule = " 0.01, TEST_SEND_PTP_ANNOUNCE,      \
                                0.02, TEST_SEND_PTP_SYNC,           \
                                0.03, TEST_SEND_ETH_HUGE,           \
                                ";
        }

        PTP_EthMap: PTP_EthernetMapping {

            parameters:

                @display("p=122,197");

            gates:
                upperLayerIn[1];
                upperLayerOut[1];
        }

        EndpointNIC: PTP_NIC {
            parameters:
                @display("p=122,355");

                PTP_ClockType   = EndPoint_PTP_ClockType;
                PTP_TwoStepFlag = PTP_TwoStepFlag;
                PTP_DelayMechanism = PTP_DelayMechanism;

            gates:
                ethg[1];
        }

        // ------------------------------------------------------------------------------
        // Switches
        // ------------------------------------------------------------------------------

        Switch_NIC: PTP_NIC {
            parameters:
                @display("p=287,355");

                PTP_ClockType = Switch_PTP_ClockType;
                PTP_TwoStepFlag = PTP_TwoStepFlag;
                PTP_DelayMechanism = PTP_DelayMechanism;

            gates:
                ethg[2];
        }

        Router_Sink: Sink {
            @display("p=287,80");

            gates:
                in[2];
        }

        // ------------------------------------------------------------------------------
        // Sink
        // ------------------------------------------------------------------------------

        PtpSinkNode: PtpMacSink {

            parameters:

                @display("p=449,355");

                MAC_Address = SinkMAC;

                PTP_ClockType = EndPoint_PTP_ClockType;
                PTP_TwoStepFlag = PTP_TwoStepFlag;
                PTP_DelayMechanism = PTP_DelayMechanism;

            gates:
                ethg[1];
        }

    connections allowunconnected:

        FrameGen.PtpOut --> PTP_EthMap.upperLayerIn[0];
        PTP_EthMap.lowerLayerOut --> EndpointNIC.upperLayerIn;

        EndpointNIC.ethg[0] <--> GigabitCable1000m <--> Switch_NIC.ethg[0];

        Switch_NIC.upperLayerOut --> Router_Sink.in[0];
        Switch_NIC.PortRequest[0] --> Router_Sink.in[1];

        Switch_NIC.ethg[1] <--> GigabitCable1000m <--> PtpSinkNode.ethg[0];
}

