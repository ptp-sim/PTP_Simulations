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

package simulations.Testbenches.DelayQueue;


import inet.base.Sink;
import libptp.Hardware.DualDelayer.DelayQueue.DelayQueue;
import libptp.Testbenches.BabblingIP.BabblingIP;


network DelayQueueTestNetwork
{
    parameters:


    submodules:

        babblingIP: BabblingIP {

            parameters:
                @display("p=109,78");

                Interval = default(uniform( 30us, 70us ));
        }

        sink: Sink {

            parameters:
                @display("p=267,207");

            gates:
                in[1];
        }

        delayQueue: DelayQueue {

            parameters:
                @display("p=193,144");

                Delay = default(uniform( 1ms, 10ms ));
        }

    connections allowunconnected:

        babblingIP.IpOut --> delayQueue.in;
        delayQueue.out --> sink.in[0];
}
