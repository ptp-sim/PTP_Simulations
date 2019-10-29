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

package simulations.PTP.BMC_Tests.EidsonBook;

import libptp.Components.Nodes.*;
import libptp.Components.Cables.*;

network Case_1A
{
    submodules:
        OrdinaryClock_1: PTP_EN_E2E_1S_M1 {
            parameters:
                @display("p=73,84");
        }
        OrdinaryClock_2: PTP_EN_E2E_1S_M1 {
            parameters:
                @display("p=258,84");
        }

    connections:

        OrdinaryClock_1.ethg[0] <--> GigabitCable10m <--> OrdinaryClock_2.ethg[0];
}

network Case_1B
{
    submodules:
        OrdinaryClock_1: PTP_EN_E2E_1S_M3 {
            parameters:
                @display("p=73,84");
        }
        OrdinaryClock_2: PTP_EN_E2E_1S_M3 {
            parameters:
                @display("p=258,84");
        }

    connections:

        OrdinaryClock_1.ethg[0] <--> GigabitCable10m <--> OrdinaryClock_2.ethg[0];
}

network Case_2
{
    parameters:

        int N = 0;
        int W = 1;
        int S = 2;
        int E = 3;

    submodules:
        OrdinaryClock_1: PTP_EN_E2E_1S_M2 {
            parameters:
                @display("p=73,84");
        }
        OrdinaryClock_4: PTP_EN_E2E_1S_M3 {
            parameters:
                @display("p=434,84");
        }

        BoundaryClock_2: PTP_BC_E2E_1S_M3 {
            parameters:
                @display("p=188,141");

            gates:
                ethg[4];

        }
        BoundaryClock_3: PTP_BC_E2E_1S_M3 {
            parameters:
                @display("p=310,141");

            gates:
                ethg[4];
        }

    connections allowunconnected:

        OrdinaryClock_1.ethg[0] <--> GigabitCable10m <--> BoundaryClock_2.ethg[W];  // Link 1
        BoundaryClock_2.ethg[E] <--> GigabitCable10m <--> BoundaryClock_3.ethg[W];  // Link 2
        BoundaryClock_3.ethg[E] <--> GigabitCable10m <--> OrdinaryClock_4.ethg[0];  // Link 3
}

network Case_3
{
    parameters:

        int N = 0;
        int W = 1;
        int S = 2;
        int E = 3;

    submodules:
        OrdinaryClock_1: PTP_EN_E2E_1S_M1 {
            parameters:
                @display("p=73,84");
        }
        OrdinaryClock_4: PTP_EN_E2E_1S_M1 {
            parameters:
                @display("p=434,84");
        }

        BoundaryClock_2: PTP_BC_E2E_1S_M3 {
            parameters:
                @display("p=188,141");

            gates:
                ethg[4];

        }
        BoundaryClock_3: PTP_BC_E2E_1S_M3 {
            parameters:
                @display("p=310,141");

            gates:
                ethg[4];
        }

    connections allowunconnected:

        OrdinaryClock_1.ethg[0] <--> GigabitCable10m <--> BoundaryClock_2.ethg[W];  // Link 1
        BoundaryClock_2.ethg[E] <--> GigabitCable10m <--> BoundaryClock_3.ethg[W];  // Link 2
        BoundaryClock_3.ethg[E] <--> GigabitCable10m <--> OrdinaryClock_4.ethg[0];  // Link 3
}

network Case_4
{
    parameters:

        int N = 0;
        int W = 1;
        int S = 2;
        int E = 3;

    submodules:
        OrdinaryClock_1: PTP_EN_E2E_1S_M1 {
            parameters:
                @display("p=73,84");
        }
        OrdinaryClock_7: PTP_EN_E2E_1S_M1 {
            parameters:
                @display("p=617,84");
        }

        BoundaryClock_2: PTP_BC_E2E_1S_M3 {
            parameters:
                @display("p=73,185");

            gates:
                ethg[4];

        }
        BoundaryClock_3: PTP_BC_E2E_1S_M3 {
            parameters:
                @display("p=209,185");

            gates:
                ethg[4];
        }
        BoundaryClock_4: PTP_BC_E2E_1S_M3 {
            parameters:
                @display("p=341,185");

            gates:
                ethg[4];
        }
        BoundaryClock_5: PTP_BC_E2E_1S_M3 {
            parameters:
                @display("p=479,185");

            gates:
                ethg[4];
        }
        BoundaryClock_6: PTP_BC_E2E_1S_M3 {
            parameters:
                @display("p=617,185");

            gates:
                ethg[4];
        }

    connections allowunconnected:

        OrdinaryClock_1.ethg[0] <--> GigabitCable10m <--> BoundaryClock_2.ethg[N];  // Link 1
        BoundaryClock_2.ethg[E] <--> GigabitCable10m <--> BoundaryClock_3.ethg[W];  // Link 2
        BoundaryClock_3.ethg[E] <--> GigabitCable10m <--> BoundaryClock_4.ethg[W];  // Link 3
        BoundaryClock_4.ethg[E] <--> GigabitCable10m <--> BoundaryClock_5.ethg[W];  // Link 4
        BoundaryClock_5.ethg[E] <--> GigabitCable10m <--> BoundaryClock_6.ethg[W];  // Link 5
        BoundaryClock_6.ethg[0] <--> GigabitCable10m <--> OrdinaryClock_7.ethg[0];  // Link 6
}

network Case_5
{
    parameters:

        int N = 0;
        int W = 1;
        int S = 2;
        int E = 3;

    submodules:
        OrdinaryClock_1: PTP_EN_E2E_1S_M2 {
            parameters:
                @display("p=87,64");
        }
        OrdinaryClock_2: PTP_EN_E2E_1S_M3 {
            parameters:
                @display("p=394,64");
        }
        OrdinaryClock_6: PTP_EN_E2E_1S_M3 {
            parameters:
                @display("p=535,200");
        }
        OrdinaryClock_9: PTP_EN_E2E_1S_M3 {
            parameters:
                @display("p=535,345");
        }

        BoundaryClock_3: PTP_BC_E2E_1S_M3 {
            parameters:
                @display("p=87,200");

            gates:
                ethg[4];
        }
        BoundaryClock_4: PTP_BC_E2E_1S_M3 {
            parameters:
                @display("p=231,200");

            gates:
                ethg[4];
        }
        BoundaryClock_5: PTP_BC_E2E_1S_M3 {
            parameters:
                @display("p=394,200");

            gates:
                ethg[4];
        }
        BoundaryClock_7: PTP_BC_E2E_1S_M3 {
            parameters:
                @display("p=231,345");

            gates:
                ethg[4];

        }
        BoundaryClock_8: PTP_BC_E2E_1S_M3 {
            parameters:
                @display("p=394,345");

            gates:
                ethg[4];
        }

    connections allowunconnected:

        OrdinaryClock_1.ethg[0] <--> GigabitCable10m <--> BoundaryClock_3.ethg[N];  // Link 1
        BoundaryClock_3.ethg[E] <--> GigabitCable10m <--> BoundaryClock_4.ethg[W];  // Link 2
        BoundaryClock_4.ethg[E] <--> GigabitCable10m <--> BoundaryClock_5.ethg[W];  // Link 3
        OrdinaryClock_2.ethg[0] <--> GigabitCable10m <--> BoundaryClock_5.ethg[N];  // Link 4
        BoundaryClock_5.ethg[E] <--> GigabitCable10m <--> OrdinaryClock_6.ethg[0];  // Link 5
        BoundaryClock_4.ethg[S] <--> GigabitCable10m <--> BoundaryClock_7.ethg[N];  // Link 6
        BoundaryClock_5.ethg[S] <--> GigabitCable10m <--> BoundaryClock_8.ethg[N];  // Link 7
        BoundaryClock_7.ethg[E] <--> GigabitCable10m <--> BoundaryClock_8.ethg[W];  // Link 8
        BoundaryClock_8.ethg[E] <--> GigabitCable10m <--> OrdinaryClock_9.ethg[0];  // Link 9
}

network Case_6
{
    submodules:
        OrdinaryClock_1: PTP_EN_E2E_1S_M1 {
            parameters:
                @display("p=73,84");
        }
        OrdinaryClock_5: PTP_EN_E2E_1S_M1 {
            parameters:
                @display("p=567,84");
        }

        BoundaryClock_2: PTP_BC_E2E_1S_M2 {
            parameters:
                @display("p=188,141");

            gates:
                ethg[2];

        }
        BoundaryClock_3: PTP_BC_E2E_1S_M3 {
            parameters:
                @display("p=310,141");

            gates:
                ethg[2];
        }
        BoundaryClock_4: PTP_BC_E2E_1S_M2 {
            parameters:
                @display("p=442,141");

            gates:
                ethg[2];
        }

    connections:

        OrdinaryClock_1.ethg[0] <--> GigabitCable10m <--> BoundaryClock_2.ethg[0];  // Link 1
        BoundaryClock_2.ethg[1] <--> GigabitCable10m <--> BoundaryClock_3.ethg[0];  // Link 2
        BoundaryClock_3.ethg[1] <--> GigabitCable10m <--> BoundaryClock_4.ethg[0];  // Link 3
        BoundaryClock_4.ethg[1] <--> GigabitCable10m <--> OrdinaryClock_5.ethg[0];  // Link 4
}
