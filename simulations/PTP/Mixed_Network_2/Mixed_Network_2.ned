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

package simulations.PTP.Mixed_Network_2;

// ======================================================
// Imports
// ======================================================

import libptp.Components.Nodes.*;
import libptp.Components.Cables.*;

// ======================================================
// Channel declarations
// ======================================================

// ======================================================
// Network declarations
// ======================================================
network Mixed_Network_2
{
    submodules:

        Node1: PTP_EN_P2P_1S_M1 {
            parameters:
                @display("p=80,90");

            gates:
                ethg[1];
        }

        Node2: PTP_BC_P2P_1S_M2 {
            parameters:
                @display("p=240,90");

            gates:
                ethg[3];
        }

        Node3: PTP_TC_P2P_1S_SO {
            parameters:
                @display("p=400,40");

            gates:
                ethg[2];
        }

        Node4: PTP_TC_P2P_2S_SO {
            parameters:
                @display("p=560,40");

            gates:
                ethg[2];
        }

        Node5: PTP_EN_P2P_1S_M3 {
            parameters:
                @display("p=720,40");

            gates:
                ethg[1];
        }

        Node6: PTP_TC_P2P_1S_SO {
            parameters:
                @display("p=400,140");

            gates:
                ethg[2];
        }

        Node7: PTP_BC_P2P_1S_M2 {
            parameters:
                @display("p=560,140");

            gates:
                ethg[2];
        }

        Node8: PTP_EN_P2P_1S_M3 {
            parameters:
                @display("p=720,140");

            gates:
                ethg[1];
        }

    connections allowunconnected:

        // Master
        Node1.ethg[0] <--> GigabitCable20cm <--> Node2.ethg[0];

        // BC
        Node2.ethg[1] <--> GigabitCable20cm <--> Node3.ethg[0];
        Node2.ethg[2] <--> GigabitCable20cm <--> Node6.ethg[0];

        // Daisy chain 1
        Node3.ethg[1] <--> GigabitCable20cm <--> Node4.ethg[0];
        Node4.ethg[1] <--> GigabitCable20cm <--> Node5.ethg[0];

        // Daisy chain 2
        Node6.ethg[1] <--> GigabitCable20cm <--> Node7.ethg[0];
        Node7.ethg[1] <--> GigabitCable20cm <--> Node8.ethg[0];

}
