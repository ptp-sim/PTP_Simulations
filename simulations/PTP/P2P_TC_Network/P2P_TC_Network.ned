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

package simulations.PTP.P2P_TC_Network;

// ======================================================
// Imports
// ======================================================

import libptp.Components.*.*;

// ======================================================
// Channel declarations
// ======================================================

// ======================================================
// Network declarations
// ======================================================
network P2P_TC_Network
{
    submodules:

        Master: PTP_EN_P2P_1S_M2 {
            parameters:
                @display("p=71,176");

            gates:
                ethg[1];
        }

        P2P_TC_1: PTP_TC_P2P_1S_SO {
            parameters:
                @display("p=219,176");

            gates:
                ethg[2];
        }

        P2P_TC_2: PTP_TC_P2P_2S_SO {
            parameters:
                @display("p=365,176");

            gates:
                ethg[2];
        }

        Slave: PTP_EN_P2P_1S_SO {
            parameters:
                @display("p=505,176");

            gates:
                ethg[1];
        }

    connections allowunconnected:

        Master.ethg[0] <--> GigabitCable20cm <--> P2P_TC_1.ethg[1];
        P2P_TC_1.ethg[0] <--> GigabitCable20cm <--> P2P_TC_2.ethg[1];
        P2P_TC_2.ethg[0] <--> GigabitCable20cm <--> Slave.ethg[0];
}
