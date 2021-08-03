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

// ======================================================
// Package description
// ======================================================

package simulations.PTP.Simple_Network;

// ======================================================
// Imports
// ======================================================

import libptp.Components.BasicBlocks.IPTP_EtherNode;
import libptp.Components.Cables.*;

import libptp.Components.Utilities.TimeDiffObserver.*;

// ======================================================
// Channel declarations
// ======================================================

// ======================================================
// Network declarations
// ======================================================
network Simple_Network
{
    parameters:

        string NodePrefix = default("PTP_EN");

        string DelayMech = default("P2P");
        string StepType = default("1S");

        string MasterSuffix = "M2";
        string SlaveSuffix = "SO";

    submodules:

        Master: <NodePrefix + "_" + DelayMech + "_" + StepType + "_" + MasterSuffix> like IPTP_EtherNode {
            parameters:
                @display("p=100,150");

            gates:
                ethg[1];
        }

        Slave: <NodePrefix + "_" + DelayMech + "_" + StepType + "_" + SlaveSuffix> like IPTP_EtherNode {
            parameters:
                @display("p=300,150");

            gates:
                ethg[1];
        }

        TimeDiffObserver: TimeDiffObserver {
            parameters:
                @display("p=200,80");

                ClockPath1 = default("^.Master.NIC.Clock");
                ClockPath2 = default("^.Slave.NIC.Clock");

        }

    connections allowunconnected:

        Master.ethg[0] <--> GigabitCable10m <--> Slave.ethg[0];
}
