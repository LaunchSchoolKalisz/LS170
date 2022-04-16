# The Physical Network

## What is the Physical Network?

- The Physical Network is the most basic level of the network.
- It consists of the tangible physical parts, i.e. network devices, cables, and wires, which transport bits in the form of radio waves, light signals, and electrical impulses.
- It's concerned only with how data is transported across a physical medium as bits.

## What are the characteristics of the Physical Network?

- The characteristics of the Physical Network are **latency** and **bandwidth**, which come from the physical limitations of the infrastructure itself.
- **Latency** is the measure of _time_ it takes for some data to get from one point in the network to another.
  - It is determined by real physical laws, such as the distance traveled and the speed of the signal traveling (i.e. speed of light, sound, or electricity).
- **Bandwidth** refers to the _amount of data_ that can be sent along the physical structure of the network for a particular unit of time (usually a second).
  - It is also determined by real physical laws, such as the capacity of the medium down which data is being transported (ie copper wires vs fiber optic).
  - Because this is almost never a constant amount, we consider the bandwidth of a connection to be whatever value is the lowest value over the entire connection.

### The Elements of Latency

Latency has four main aspects that occur during each network "hop" that data takes during its overall journey through the network:

- **Propagation delay** - the amount of time it takes for the first bit to travel from sender to receiver, limited naturally, and calculated as the ratio between distance and speed (usually the speed of light). We can think of propagation delay as the physical limits imposed by nature and geographic distance.
- **Transmission delay** - the amount of time it takes to transmit data into one of the "nodes" or "links" in the overall network. In other words, the delay that occurs as a result of the signal traveling down multiple hops or links, interconnected by routers and switches, etc. Reducing the number of hops required to the destination would reduce this delay.
- **Processing delay** - the amount of time it takes to have to process data at any point along the transmission route. We could potentially reduce processing delay by upgrading to more efficient routers that can redirect traffic faster.
- **Queuing delay** - the amount of time the packet waits in line to be processed if there is too much data to be processed at one time at the network device (i.e. "node" or "link") the data is being sent to. This can be caused because of insufficient bandwidth, a particularly high traffic time of the day, or an inefficient router. If data is arriving at a router at a faster rate than the router is able to redirect it appropriately, this gives rise to queuing delay. Breaking up a hop into several hops, with more routers, may help to reduce queuing delay, but it may add to transmission delay.

Overall latency is the sum of all these elements for each network hop, plus any of the following delays:

- **Last-mile latency** - a "slowing down" that takes place at the network edge, as smaller and more frequent hops take place as data moves lower in the network hierarchy
- **RTT** - **Round Trip Time** - the time it takes for a single message to get from sender to receiver and then back again.
  - This can refer to exchanges between 'nodes' on a P2P network, or exchanges between client and server.
  - Latency overhead associated with additional round trips is often a trade off when dealing with the implementation of network reliability in TCP.