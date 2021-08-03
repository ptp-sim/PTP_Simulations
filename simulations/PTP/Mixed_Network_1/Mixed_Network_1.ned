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

package simulations.PTP.Mixed_Network_1;

// ======================================================
// Imports
// ======================================================

import libptp.Components.Nodes.*;
import libptp.Components.Cables.*;

import inet.base.Sink;
import inet.nodes.ethernet.EtherHost;
import inet.nodes.ethernet.EtherSwitch;

// ======================================================
// Channel declarations
// ======================================================

// ======================================================
// Network declarations
// ======================================================
network Mixed_Network_1
{
    submodules:

        Master: PTP_EN_P2P_1S_M2 {
            parameters:
                @display("p=90,177");

            gates:
                ethg[1];
        }

        BoundaryClk: PTP_BC_P2P_1S_M3 {
            parameters:
                @display("p=217,177");

            gates:
                ethg[2];
        }

        TC_1S: PTP_TC_P2P_1S_SO {
            parameters:
                @display("p=364,177");

            gates:
                ethg[2];
        }

        TC_2S: PTP_TC_P2P_2S_SO {
            parameters:
                @display("p=683,177");

            gates:
                ethg[2];
        }

        Office_PC_1: EtherHost {
            parameters:
                @display("p=525,54;is=l");
        }
        Office_PC_2: EtherHost {
            parameters:
                @display("p=525,274;is=l");
        }

        Office_Switch: EtherSwitch {
            parameters:
                @display("p=526,176;is=l");
            gates:
                ethg[5];
        }


        Slave: PTP_EN_P2P_1S_SO {
            parameters:
                @display("p=833,177");

            gates:
                ethg[1];
        }

    connections allowunconnected:

        Master.ethg[0]          <--> GigabitCable100m   <--> BoundaryClk.ethg[0];
        BoundaryClk.ethg[1]     <--> GigabitCable10m   <--> TC_1S.ethg[0];
        TC_1S.ethg[1]           <--> GigabitCable10m   <--> Office_Switch.ethg[0];
        Office_Switch.ethg[1]   <--> GigabitCable10m   <--> TC_2S.ethg[0];
        TC_2S.ethg[1]           <--> GigabitCable10m   <--> Slave.ethg[0];

        Office_Switch.ethg[2]   <--> GigabitCable10m   <--> Office_PC_1.ethg;
        Office_Switch.ethg[3]   <--> GigabitCable10m   <--> Office_PC_2.ethg;

}
