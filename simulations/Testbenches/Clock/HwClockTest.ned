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

package simulations.Testbenches.Clock;

import libptp.Hardware.HwClock.ScheduleClock.IScheduleClock;
import libptp.Components.Utilities.TimeDiffObserver.*;
import libptp.Testbenches.*.*;

network HwClockNetwork
{
    parameters:

        string ClockType1 = default("PerfectScheduleClock");
        string ClockType2 = default("PerfectScheduleClock");

    submodules:

        // ---------------------------------------------------------------
        // Clocks
        // ---------------------------------------------------------------

        Clock1: <ClockType1> like IScheduleClock {
            parameters:
                @display("p=192,120");
        }

        Clock2: <ClockType2> like IScheduleClock {
            parameters:
                @display("p=367,120");
        }


        // ---------------------------------------------------------------
        // Time observers
        // ---------------------------------------------------------------
        Observer: TimeDiffObserver {
            parameters:
                @display("p=278,227");

                ClockPath1 = "^.Clock1";
                ClockPath2 = "^.Clock2";
        }

        // ---------------------------------------------------------------
        // Tests
        // ---------------------------------------------------------------

//        ConstantTest1: ClockTest {
//            parameters:
//                @display("p=479,160");
//                ClockPath = "^.ConstantDriftClock";
//        }

    connections:
}
