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

package simulations.PTP.Single_Master_Network;

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
network Single_Master_Network
{
    submodules:

        Master: PTP_EN_E2E_2S_M1 {
            parameters:
                @display("p=71,176");

            gates:
                ethg[1];
        }

    connections allowunconnected:

}
