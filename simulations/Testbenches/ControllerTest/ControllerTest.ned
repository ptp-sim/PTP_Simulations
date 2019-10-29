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

package simulations.Testbenches.ControllerTest;

import libptp.Hardware.HwClock.ScheduleClock.IScheduleClock;

import libptp.Software.ClockServo.IClockServo;
import libptp.Software.ClockServo.*;
import libptp.Testbenches.ClockServoTest.ClockServoTest;

network ControllerTest
{
    parameters:

        string ClockServoType = default("PI_ClockServo");
        string MasterClockType = default("PerfectScheduleClock");
        string SlaveClockType = default("PerfectScheduleClock");

    submodules:

        ClockServo: <ClockServoType> like IClockServo {
            parameters:
                @display("p=249,189");
        }

        MasterClock: <MasterClockType> like IScheduleClock {
            @display("p=166,303");
        }

        SlaveClock: <SlaveClockType> like IScheduleClock {
            @display("p=334,303");
        }

        clockServoTest: ClockServoTest {
            @display("p=249,72");

            MasterClockPath = "^.MasterClock";
            SlaveClockPath = "^.SlaveClock";
        }
}
