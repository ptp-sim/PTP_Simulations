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

package simulations.Testbenches.INET.INET;

import inet.applications.tcpapp.TCPSinkApp;
import inet.applications.tcpapp.TelnetApp;
import inet.linklayer.loopback.LoopbackInterface;
import inet.nodes.ethernet.EtherSwitch;
import inet.nodes.inet.NetworkLayer;
import inet.nodes.inet.Router;
import inet.nodes.inet.StandardHost;


//
// TODO Auto-generated network
//
network INET
{
    submodules:
        etherSwitch: EtherSwitch {
            @display("p=76,263");
        }
        standardHost: StandardHost {
            @display("p=76,48");
        }
        telnetApp: TelnetApp {
            @display("p=220,81");
        }
        tcpSinkApp: TCPSinkApp {
            @display("p=90,151");
        }
        router: Router {
            @display("p=248,264");
        }
        networkLayer: NetworkLayer {
            @display("p=194,190");
        }
        loopbackInterface: LoopbackInterface {
            @display("p=175,337");
        }
}
