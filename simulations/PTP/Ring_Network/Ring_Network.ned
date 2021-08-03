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

package simulations.PTP.Ring_Network;

// ======================================================
// Imports
// ======================================================

import libptp.Components.BasicBlocks.IPTP_EtherNode;
import libptp.Components.Nodes.*;
import libptp.Components.Cables.*;
import libptp.Components.Utilities.TimeDiffObserver.TimeDiffObserver;


network Ring_Network
{
    parameters:

        int NumNodes = default(30);

    submodules:

        Nodes[NumNodes]: <> like IPTP_EtherNode {
            parameters:
                @display("p=437,187,ri,500,500");

            gates:
                ethg[2];
        }

        TimeDiffObserver: TimeDiffObserver {
            parameters:
                @display("p=200,204");

                ClockPath1 = default("^.Nodes[0].NIC.Clock");
                ClockPath2 = default("^.Nodes[1].NIC.Clock");
        }
    connections allowunconnected:

        for i=0..NumNodes-2 {
            Nodes[i].ethg[1] <--> GigabitCable <--> Nodes[i+1].ethg[0];
        }

        Nodes[NumNodes-1].ethg[1] <--> GigabitCable <--> Nodes[0].ethg[0];
}
