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

package simulations.PTP.Daisy_Chain_Network;

// ======================================================
// Imports
// ======================================================

import libptp.Components.*.*;

import libptp.Components.Utilities.TimeDiffObserver.*;

// ======================================================
// Channel declarations
// ======================================================

// ======================================================
// Network declarations
// ======================================================
network Daisy_Chain_Network
{
    parameters:

        int NumNodes = default(100);
        int NumObserver = NumNodes/10;

    submodules:

        Master: PTP_EN_P2P_1S_M1 {
            parameters:
                @display("p=315,102");

            gates:
                ethg[1];
        }

        Nodes[NumNodes]: <> like IPTP_EtherNode {
            parameters:
                @display("p=473,102,m,10,100,100");

            gates:
                ethg[2];
        }

        Endnode: PTP_EN_P2P_1S_SO {
            parameters:
                @display("p=315,197");

            gates:
                ethg[1];
        }

        TimeDiffObserver[NumObserver]: TimeDiffObserver {
            parameters:
                @display("p=122,102,c,100");

                ClockPath1 = default("^.Master.NIC.Clock");
                ClockPath2 = default("^.Nodes[" + string(((index+1) * 10)-1) + "].NIC.Clock");

        }

    connections allowunconnected:

        Endnode.ethg[0] <--> GigabitCable <--> Nodes[0].ethg[0];

        for i=0..NumNodes-2 {
            Nodes[i].ethg[1] <--> GigabitCable <--> Nodes[i+1].ethg[0];
        }

        Nodes[NumNodes-1].ethg[1] <--> GigabitCable <--> Master.ethg[0];
}
