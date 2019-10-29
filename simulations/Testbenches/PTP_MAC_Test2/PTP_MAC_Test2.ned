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

package simulations.Testbenches.PTP_MAC_Test2;

import libptp.Components.*.*;

import libptp.Hardware.*;
import libptp.Hardware.*.*;

import libptp.Firmware.*.*;

import libptp.Testbenches.PtpMacSource.PtpMacSource;
import libptp.Testbenches.PtpMacSink.PtpMacSink;


network PTP_MAC_Test2
{
    parameters:

        bool PTP_TwoStepFlag = default(false);
        string PTP_DelayMechanism = default("DELAY_MECH_P2P");

        string Source_MAC = default("C0:FF:EE:00:00:01");
        string Sink_MAC = default("C0:FF:EE:00:00:02");

    submodules:

        // ------------------------------------------------------------------------------
        // Source
        // ------------------------------------------------------------------------------
        SourceNode: PtpMacSource {

            parameters:

                @display("p=83,84");

                FrameSource.TestSchedule = "0.01, TEST_SEND_ETH_TINY,           \
                                            ";

                MAC_Address = Source_MAC;
                PTP_ClockType = "PTP_CLOCK_TYPE_ORDINARY";
                PTP_TwoStepFlag = PTP_TwoStepFlag;
                PTP_DelayMechanism = PTP_DelayMechanism;

            gates:
                ethg[1];
        }

        // ------------------------------------------------------------------------------
        // Sink
        // ------------------------------------------------------------------------------
        SinkNode: PtpMacSink {

            parameters:

                @display("p=251,84");

                MAC_Address = Sink_MAC;
                PTP_ClockType = "PTP_CLOCK_TYPE_ORDINARY";
                PTP_TwoStepFlag = PTP_TwoStepFlag;
                PTP_DelayMechanism = PTP_DelayMechanism;

            gates:
                ethg[1];
        }

    connections allowunconnected:

        SourceNode.ethg[0] <--> GigabitCable1000m <--> SinkNode.ethg[0];
}

