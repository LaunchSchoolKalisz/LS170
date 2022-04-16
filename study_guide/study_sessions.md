# Study sessions

- [The Internet](#the-internet)
  - [What is the internet?](#what-is-the-internet?)
  - [What are protocols?](#what-are-protocols,-and-why-are-they-necessary?)
  - [Data Encapsulation and the Network Model](#explain-how-data-encapsulation-works-in-the-context-of-a-network-model)
  - [PDUs](#pdus)
  - [The Physical Network](#the-physical-network)
  - [The Ethernet Protocol](#the-ethernet-protocol)
  - [Internet Function](#internet-function)

- [TCP & UDP](#tcp--udp)
  - [The Transport Layer](#the-transport-layer)
  - [Connectionless vs Connection-Oriented](#connectionless-vs-connection-oriented)
  - [TCP?](#tcp)
  - [What is Flow Control?](#flow-control)
  - [UDP](#udp)
  - [Pipelineing](#what-is-pipelining)
  - [Network Reliability](#what-are-the-4-key-elements-needed-to-guarantee-network-reliability)

- [URLs & More](#urls-and-more)
  - [DNS](#dns)
  - [URLs](#urls)
  - [HTTPs](#http-and-the-requestresponse-cycle)

- [HTTP & More](#http-and-more)
  - [HTTP](#http)
  - [TLS](#tls)


# The Internet

## What is the internet?

* The web is a service that can be accessed via the internet
* The web is the resources that is being transported
* The internet is the infrastructure that enables the transferring

## What are protocols, and why are they necessary?

* Consist of sets of rules that govern networked communication
* They create an established agreement on how to communicate
* We need them because otherwise the many and varied devices on the network would not have a cohesive and uniform communication method

## Explain how data encapsulation works in the context of a network model

In the context of networking, **encapsulation** is the process of packaging data of a protocol at a higher layer with metadata of a protocol at the current layer, forming a Protocol Data Unit (PDU).
In other words, a PDU of a protocol at a higher layer is *encapsulated* in a PDU of a protocol at the current layer.

Encapsulation enables protocols at different layers to work together by providing separation and creating a certain level of abstraction — the protocol at the current layer can provide a 'service' for the protocol at the higher layer, without concerning about any protocol-specific information of the higher-layer protocol.
This is particularly pertinent when there are many different protocols used at one network layer (e.g., protocols at the Application layer include HTTP, SMTP, FTP, and more; a protocol at the Transport layer does not need to know about which protocol it services).

---

One of the functions in categorizing protocol groups into separate layers is the ability to encapsulate data. Ostensibly, what we are doing is hiding data away within layers, by encapsulating it within a data unit of the layer below. A layer is mostly concerned with it's _header_, that is, the meta-data attached to it's data payload that tells it what to do. It doesn't really matter what the data payload _is_ as long as the header information is complete and the layer can perform its intended function. This means that a protocol at one layer doesn't need to know anything at all about how protocols in other layers are implemented in order for them to interact.

## PDUs
### What is a Protocol Data Unit (PDU)? What is its purpose in the context of network communication?

* Protocol Data Unit
* a block of data that gets transported over the network by the current "governing" protocol
* The unit itself depends on the layer in which we are currently functioning
* A PDU consists of a _header_ which contains meta-data specific to the current protocol's responsibility / service
* A PDU has a _data payload_ which contains the entire PDU from the layer above the current layer
* It facilitates encapsulation of data, allowing each protocol to operate a modularized process, and perform the service that it is allocated in conjunction with the other protocols that make up the network.

**Caution!** higher-level vs higher layer are two different concepts

### How do the different parts of a PDU interact?

* PDU consists of a header, data payload, and an optional footer.
* Header contains metadata concerning the current protocol, and this metadata facilitates the service the protcol is performing for the data payload.
* Data payload contains the data that the current protocol wants to transport. Specifically, the payload is the PDU of a higher layer.

## The Physical Network
### What is the physical network? What are the characteristics of the physical network?

* The most basic level of the network
* Consists of the tangible physical parts, i.e. network devices, cables, wires.
* Which transport bits in the form of radio waves, light signals, electrical signals.
* It is concerned only with how data is transported across a physical medium as bits
* It's characteristics include _latency_ and _bandwidth_, which come from the physical limitations of the physical infrastructure itself.
* These limitations create implications on how protocols are operating at higher layers.

---

* These limitations influence how developers use protocols in higher layers when building applications.
* Because these physical limitations (i.e. latency and bandwidth) are inevitable, they must be mitigated by the choices of the developer, who should always seek to optimize by limiting their effect as much as possible.

### Describe the different elements of latency and what each is caused by

Latency is the sum of four delays:

* Propagation delay — amount of time it takes for the first bit to travel from sender to receiver.
* Transmission delay — amount of time it takes to push all the packet's bits onto the link (i.e., wire).
* Processing delay — amount of time it takes routers to process the packet header.
* Queuing delay — amount of time the packet waits in queue.

Other important concepts are:

* Last-mile latency - delays that take place at the "network edge", as smaller and more frequent hops take place as data moves lower in the network hierarchy.The most delay is introduced here.
* RTT - Round Trip Time, the time it takes for a single message to get from sender to receiver and then back again. This could refer to exchanges between 'nodes' on a P2P network, or exchanges between client and server.

## The Ethernet Protocol

### What is the Ethernet protocol? What is its purpose in the context of network communication?

* Overall purpose: governs communication between devices in a local network
* Operating at the Link/Data Link Layer
* It's PDU is known as an Ethernet Frame
* Ethernet provides two main functions:
  * (Framing) It adds logical structure to the streams of bits traveling through the Physical layer, and acts as an interface between the physical network infrastructure and the more logical layers above it.
  * (Addressing) Identifies the next network "node" to which data should be sent through the use of MAC addresses. Identifies the intended recipient device.

### What is a MAC address and what are its characteristics?

* A physical, permanent, "burned-in" address for a specific network device.
* It consists of a sequence of six two digit hexadecimal numbers (i.e. `00:01:02:3f`).
* Different kinds of network devices (i.e. routers, computers, refrigerators) are assigned different ranges of MAC addresses.
* MAC addresses work well in LANs, where devices are connected to a central hub that recall their specific MAC address
* They do not work well in large decentralized systems, because:
  * They are physical, not logical
  * They are flat, not hierarchical structure that allows us to categorize them into searchable subdivisions

## Internet Function
What is the primary function of the Internet / Network Layer? What Protocols govern this function?

* This layer is concerned with communication between devices on different networks (i.e., inter-network communication).
* It comes between protocols at the Link/Data Link layer and protocols at the Transport layer.
* The primary protocol that governs this function is the Internet Protocol (IP).

* IP provides routing capabilities between devices on different networks via IP addresses.
* It also encapsulates data in packets.

### How does IP structure data and implement its functionality?

* IP uses a PDU called a packet.
* A packet consists of a header and a data payload:
  * Header contains source and destination IP address, which version of IP, fragmentation data, TTL.
  * Data payload contains the PDU of the protocol at the transport layer

* The IP addresses in the header allow for IP addressing
* IP addresses have two main features that allow for inter-network communication:
  * They're logical — they are assigned as required when devices join a network
  * They're hierarchical — the structure of the address allows us to categorize them into searchable subdivisions. The overall network is divided into logical sub-networks and numbers are allocated accordingly to this hierarchy.

### Why are there two versions of IP?

* 32-bit vs 128-bit
* bit is 0 or 1. 2
* 4.3 billion vs 340 undecillion

### What gaps in MAC addressing does IP addressing fill?

* MAC addresses, due to their nature, are not _scalable_.
* IP addresses, because they are logical and hierarchical, are.

### What does IP addressing allow us to do, and what does it _not_ allow us to do?

* The IP address only gets us in communication with the intended device
* It does not allow us to isolate any particular application or process running on that device

# TCP & UDP

## The Transport Layer
### What is The Transport Layer and what is it concerned with?

* End-to-end communication between processes
* Specifically, enable multiplexing

* Multiplexing is the transmission of multiple data inputs over a single channel of communication
* This is important because often times, there are multiple applications running on a single device, and yet, with IP addresses, there is only a single channel
* Enables end-to-end communication between a specific process running on two different devices

### How is multiplexing enabled?

* Multiplexing is implemented through the use of _port_ numbers alongside IP addresses.
* Each specific process is assigned a single port, which can be used to identify that same process running on a different device.
* Ip address and port number pair defines a communication end-point known as a network socket
* These sockets allow both IP and the protocol operating at the Transport Layer to transmit data between devices and processes.

### What is a socket? What is its purpose in the context of network communication?

* A **socket** refers to the communication end-point that consists of the port number and IP address together.
* The IP address gets us the correct device on the network, and the port number gets us to the correct application on that device.
* Sockets facilitate multiplexing.

Other things to consider:

* The ability to programmatically instantiate socket objects specifically defined to listen for particular communications (i.e. for a certain application from a certain host) allows for us to implement both connection oriented and connectionless communication systems.

___

* Conceptually, a socket facilitates multiplexing. On a practicl level, instantiation of a socket object in code can implement a TCP or UDP connection specifically.

## Connectionless vs Connection-Oriented
### What is the difference between a connectionless system and a connection-oriented system?

* A connection-oriented system instantiates new socket objects to establish a dedicated communication channel between two processes on separate devices.
  * This is useful for establishing specific rules of communication (i.e., in-order delivery of TCP)
* A connectionless system relies on a single socket for all communication, doesn't establish dedicated communication channels, and responds to all communications individually as they arrive.
  * Reduces overhead/latency because a connection doesn't need to be established

### How are connections in a connection-oriented system recognized?

* Via a four-tuple:
  * IP and port of sender
  * IP and port of receiver

## TCP
What is the TCP protocol? What services does it provide?

* Transmission Control Protocol -> Transport Layer
* A connection-oriented protocol that ensures reliable data transfer on top of the unreliable channels of lower-layer protocols.
* The reliability of TCP comes from the TCP three-way handshake process, which establishes connections by way of message acknowledgement which ensures retransmission of data in case of data loss as well as in-order delivery of data.
* TCP data is encapsulated into a PDU called a TCP segment, which provides five main services:
  * Multiplexing through source and destination port hear metadata
  * Error detection through checksum header metadata
  * In-order delivery, handling data loss, and handling data duplication through sequence number and acknowledgement number header metadata
  * Flow control through window size header metadata
  * Congestion avoidance through monitoring data loss and adjusting flow accordingly

___

* Transmission Control Protocol -> Transport Layer
* Like UDP, it provides multiplexing.
* On top of this, it has features that ensures reliability. Specifically, this is established through the three-way handshake and has 4 main features:
  * data integrity, de-duplication, in-order delivery, and retransmission of lost data.
* There is a lot of latency due to this reliability

* To mitigate this latency and to be as efficient as possible, TCP provides flow control and congestion avoidance.

### What are the steps for the three-way handshake? What is its purpose?

* First the sender sends a `SYN` segment, which ostensibly asks if the receiver is ready to receive.
* Upon receipt of the `SYN` segment, the receiver sends back a `SYN ACK` segment, indicating it received the previous message and ensuring that its messages are also being received.
* Finally, upon receiving the `SYN ACK`, the original sender sends an `ACK` segment, indicating it is also receiving messages from the receiver, and the connection can be (and subsequently is) established.
* This not only ensures a reliable connection between both devices, but synchronizes sequence numbers that will be used during the connection.
* Allows you to build in features of reliability, such as...

### What are the disadvantages of TCP?

* TCP provides reliability at the cost of speed (latency)
* First, there is added overhead due to the need of establishing a connection with a three-way handshake
  * add up to two RTTs of latency
* There is also the possibility of additional delays due to Head-of-line blocking as a result of in-order delivery.
  * Because TCP provides in-order delivery of segments, a single segment that has a delay (say due to being dropped and retransmitted) can "hold up" the other segments behind it
  * This can lead to increased queuing delay.

* It's not flexible as other protocols like UDP.

## Flow Control
### What is flow control?

* Provided by TCP
* helps to ensure that data is transmitted as efficiently as possible
* helps to mitigate the increased latency inherent in TCP connections
* used to prevent the sender from overwhelming the receiver with too much data at once
* Implemented via the _window_ field of the TCP segment header
  * contains data sent by the receiver letting the sender know the maximum amount of data it can accept at any given time
  * This number is dynamically generated, and the receiver can lower the amount if the buffer is getting full, and the sender will respond accordingly

___

* Each side of a connection can let the other side know...

### What is congestion avoidance?

* Congestion avoidance attempts to prevent network congestion, which is a situation where more data is being transmitted than there is capacity for.
* TCP implements this using data loss as a feedback mechanism. Specifically, if there are a lot of retransmissions happening, TCP takes this as a sign to reduce the size of transmission
* This is to make data transmission efficient as possible to mitigate the latency overhead inherent in TCP connections

___

* Congestion avoidance is implemented by tracking how many retransmissions are required.
* A lot of data loss indicates there is more data on the network than there is network capacity to process that data.
* Therefore, a lot of retransmissions will cause TCP to lower the size of the transmission window, that is, less data will be sent along the given channel.

Latency overhead: Any latency that is added to the existing latency caused by limitations of the physical realm

## UDP
### What is UDP? What services does it provide?

* User Datagram Protocol
* PDU -> datagram
* UDP is a connectionless protocol that exists at the Transport layer
* Like TCP, it enables multiplexing through source and destination port metadata
* Unlike TCP, it doesn't provide very many reliability features (other than checksum), which it makes up for with its speed and flexibility
* Speed:
  * UDP provides speed because it doesn't establish a connection (it's connectionless)
  * There is also no Head-of-line blocking as there is no in-order delivery.
  * One way data flow of a connectionless system means less latency (no acknowledgements)
  
* Flexibility
  * UDP is a base that programmers can build upon. They can add features as desired at the Application layer.
  * Specifics of what type of reliability functions to include are left up to the developer to implement at the Application level.
  
### What is the PDU for UDP and how is it structured?

* datagram
* headers:
  * source port and destination port which provides for multiplexing and socket routing
  * length
  * checksum
* data payload:
  * encapsulated HTTP request/response
  
### What are some use cased for UDP over TCP?

* Any application that prioritizes speed and flexibility
* Video calling applications like Zoom
  * Prioritizes speed over occasional lost data
* First-person shooter games

## Which protocols distinguish the client from the server?

* HTTP is the only protocol that distinguishes the client from the server?
* Request -> client
  Response -> server

## What is pipelining?

* Sending multiple messages at once without waiting for an acknowledgment.
* This is necessary because if each data transmission must _stop and wait_ for an acknowledgement too much time is spent waiting for the recipient's ACK, which contributes greatly to latency overhead.
* Pipelining transmissions can mitigate the latency added by additional waiting time.
* streamlining
* Ensures TCP is reliable but also efficient as possible

## What are the 4 key elements needed to guarantee network reliability?

* In-order delivery (sequence numbers)
* Error Detection (checksum)
* Handling Data Loss (making sure data is retransmitted -> ACK)
* Handling Duplication (delete duplicate data via sequence numbers)
* data integrity, de-duplication, in-order delivery, and retransmission of lost data

# URLs, and more
## DNS
### What is DNS?

* DNS stands for Domain Name System
* It is a distributed database that translates a domain name (i.e., `https://www.google.com`) to an IP address (i.e., `123.456.123.456`)
* For convenience (people find it easier to remember domain names, not a sequence of numbers)

### How does it work?

* DNS databases are stored on special devices called DNS servers.
* Each of these is a member of a huge hierarchical system and contains only a part of the database that maps domain names to IP addresses.
* When a domain name is entered into a browser address bar, a *DNS request* is sent to retrieve the corresponding IP address.
* If the DNS server that recieves the request does not have the correct domain name, it will route the request up the hierarchical system until it finds it.
* DNS then hands that IP address to the lower level protocols that are responsible for routing the HTTP request to the proper location.

### What is it concerned with?

* It is a service that allows us to utilize user friendly domain names rather than hard to recall strings of numbers like IP addresses.

## URLs

* Be able to identify the components of a URL, including query strings
* Be able to construct a valid URL
* Have an understanding of what URL encoding is and when it might be used

### What is an URL? What is its purpose in the context of network communication?

* Uniform Resource Locator
* A consistently formatted string that allows us to _locate_ a certain resource on the web.
* It consists of the scheme, host, path, port number, and any query strings that we wish to include.
* It provides us with a systematic means of locating resources that we are requesting.

### What is URL a subset of?

* A URL is a type of URI
* Uniform Resource Identifier
* Refers to any kind of uniform string that identifies a particular resource.
  * For example, ISBN for a publication
* A URL _must_ include some piece of data that allows us to locate the resource in question, while a URI does not have this requirement, it only identifies a particular resource, rather than also locating it.
* URL refers to a specific kind of URI in which the formatting has already been determined and it contains the location of a particular resource on the web.
* URL and URI are often used interchangeably

### What are the components of an URL, and what purpose do they serve?

Example URL: `https://app.coderpad.io:1234/KAFWN7FJ?hello=world&coder=pad`

* The *scheme* indicates which protocol should be used to access the particular resource
  * `https`
  * Scheme is different from protocol
  * It indicates which protocol group should be used, but not the specific version
  * Schemes and protocols can be distinguished by case -> schemes are lowercase and protocols are uppercase (`https` vs HTTPS)
* The *host* indicates where the resource in question is located (or hosted).
  * This is written in the format of a *domain*
  * `app.coderpad.io`
  * DNS takes this human readable domain and finds the equivalent IP so the request can be routed
* The *port* is an identifier for the specific process
  * `1234`
  * It is optional
  * If no port is specified, the default of the scheme will be used
* The *path* indicates exactly what specific resource is being requested from the host (if one).
  * Optional if the URL is locating some homepage
  * `/KAFWN7FJ`
  * This tells us we want to access the specific Coderpad running at the location `/KAFWN7FJ`
  * Historically, this has indicated specifically where the resource was located on the server, but with the proliferation of dynamically generated content, this no longer always follows the absolute file path of the server
* The *query string* passes additional information to the server
  * `?hello=world&coder=pad`
  * It is made up of query parameters, which are name/value pairs that are separated with the `=` sign
  * If there are multiple query parameters, they can be combined with the `&`
  * The beginning of a query string is denoted by `?`
  * Limited in use in that they have a maximum length, and are not suitable for sensitive information (as they are plainly visible in the URL.

### What is URL encoding, and why is it necessary?

* A special technique that replaces characters that aren't allowed in a URL with an ASCII code.
* An URL only allows certain characters in the standard 128-character set
* Certain characters are not allowed. These can include:
  * characters that are not members of the original ASCII set assigned to URLs
  * characters that are "reserved" because they have some kind of special meaning within a URL (`?`, `&`)
  * "unsafe" characters can be misinterpreted for a variety of reasons (e.g., `%`, '` `')
* Works by replacing the character in question with a `%` + two hexadecimal digits (ASCII code) (e.g., `%20`)
* The characters listed that aren't allowed in a URL will "break" the URL, in that it will no longer be able to locate the resource in question, and therefore we need a way to safely represent those characters.

### Construct a valid URL

Request a resource using HTTP from the domain ginni.com that is called 'my_resource.md' and limit the responses to those that contain only notes items.

`http://www.ginni.com/my_resource.md?item_category=notes`

Request a resource using HTTP from the localhost with port number 88. The resource is called hello.md.

`http://localhost:88/my_folder/hello.md`

## HTTP and the Request/Response Cycle

* Be able to explain what HTTP requests and responses are, and identify the components of each
* Be able to describe the HTTP request/response cycle
* Be able to explain what status codes are, and provide examples of different status code types
* Understand what is meant by ‘state’ in the context of the web, and be able to explain some techniques that are used to simulate state
* Explain the difference between GET and POST, and know when to choose each

### What is HTTP? What is its purpose?

* Hypertext Transfer Protocol
* The protocol that governs how applications structure messages between each other in the Application Layer of networked communications.
* It determines how requests are made and how they are responded to with regards to resources on the web.
* Provides uniformity to the way resources are transferred. In other words, it is an agreed-upon format on how to communicate

### High level explanation as to what HTTP consists of?

* HTTP request
  * aimed to access a resource on the server
  * client to the server
* HTTP response
  * response to the client's request
  * server to the client
* Together they are a request/response cycle

___

* HTTP is based on the client-server paradigm, in which a client (usually some kind of browser) makes a request through the network for some kind of resource that's stored on a server.
* The server, then, sends a response to this request that ideally contains the requested resource, or if not, some kind of messaging that explains what happened.
  * provide the client with the resource requested, inform the client that the action requested has been carried out, or else to inform the client that an error occurred in the process
* HTTP governs the syntax of these messages, which together consist of the request/response cycle.

### What is the client-server model? How does this tie in with an HTTP request/response cycle?

* The client-server model is one in which the two devices transmitting data over the network each have a certain role
* The client generally describes some kind of web-browser. They are responsible for issuing HTTP requests and processing the responses such that they are readable for humans (such as rendering the HTML of a webpage)
* The server is a remote computer capable of handling inbound requests. Their job is to issue an HTTP response, which ideally will contain the resource requested by the client, or if not, some kind of messaging that explains what happened.
* The server in this model is not limited to a single device, in reality it refers to all the server-side infrastructure that processes the requests and provides the responses.

### What are the different components of server-side infrastructure?

* The three primary pieces of server-side infrastructure are the *web server*, the *application server* and the *data store*
* *web server* = responding to requests for static resources, ie they do not require data processing (CSS files)
* *application server* = handling more complicated requests, such as those that contain application or business logic. Any server side code lives here
* *data store* = some kind of storage construct that can save data for later retrieval and processing.

### What is a resource? What is its role in the general scheme of networked communication?

* Resource is a generic term for any number of things that a user interacts with on the internet that can be retrieved with a URL.
  * This can include:
  * images
  * videos
  * web pages
  * files
  * software
  * games
* It makes up the web
* There are no limits to the number of resources
* A resource is the thing that we, the user, interact with via the client (browser)
* It is that to which all the layers of the networked communication model provide their various services, so that we can see/hear/click/interact with the _remote_ resource from any location via the internet.

### What is an HTTP request? What does it consist of?

* HTTP request is a text-based message sent from the client to server with the aim of accessing a resource on the server
* Consists of a request line, headers, and an optional budy
  * Request line contains method, path, and version
    * method = what kind of action the request is performing (i.e. `GET` or `POST`)
    * path = where to find the resource locally within the server
  * Headers give more infomration. Specifically, the host header is required since HTTP 1.1
    * host = indicates where the resource is located (a server may contain many hosts)
  * Body contains data that is trasmitted with the HTTP request. It is mainly used in `POST` requests

### What are `GET` and `POST` requests? What are their use cases?

* A `GET` request is used to _retrieve_ some resource from the server.
* A `POST` request is used whenever you want to _send_ something to the server, either to transmit data or initiate some kind of server side action
* Without `POST` requests we are limited to sending data to the server via query strings.
* These not only have a length limitation, but also can expose sensitive data.
* A `POST` request, on the other hand, allows us to send larger data (such as images or videos) as well as deal with more sensitive data such as a username or password.
* Typically a `POST` request will be used when submitting some kind of form or other information (such as authentication)
* A `GET` request will be used when clicking on a link or retrieving a resource

### What is an HTTP response? What does it consist of?

* HTTP responses are text-based messages sent from the server to the client with the aim of responding to the client's request
  * Provide the client with the resource requested
  * Inform the client that the action it requested was carried out
  * Inform the client that an error occurred in the process
* It consists of a response line, headers, and message body
  * Response line contains the status code, status text, and version
  * Headers contain additional information about the response
  * Message body is the raw response data

### Give me some examples of status codes and what they mean?

* Status codes are three-digit numbers that signify the status of a request
* Common codes are:
  * `200` -> OK -> Successfully handled
  * `302` -> FOUND -> Requested resource has moved temporarily, and a web browser will redirect appropriately
  * `404` -> NOT FOUND -> Cannot be found, due to client error with request
  * `500` -> INTERNAL SERVER ERROR -> there was an error
  
___

* 200 level -> response successful
* 300 level -> redirect
* 400 level -> client error
* 500 level -> server error

### How are 300 level requests handled by browsers?

* When an HTTP response consists of a 300 level redirect status code, the `Location` header is added to the response headers
* This indicates the new location of the resource in question with the updated URL
* When the browser received the HTTP 300 response, it will automatically issue an HTTP request to the updated URL provided by the `Location` header.
* This, ideally, will result in the HTTP 200 OK response so that the browser can render the resource for the user

### What are the differences when using a web browser versus an HTTP tool?

* When using an HTTP tool, a new request for redirected resources will not be issued automatically, unlike as with a browser
* When using an HTTP tool the body of the response will not be rendered in a user friendly fashion as with a browser, rather the raw contents (such as HTML) will be displayed
  * browser will request all referenced resources
  * HTTP tool will not
* A browser is like Bundler - it manages all the dependencies and an HTTP tool is not

# HTTP and more

## Topics of interest

* Be able to explain what HTTP requests and responses are, and identify the components of each
* Be able to describe the HTTP request/response cycle
* Be able to explain what status codes are, and provide examples of different status code types
* Understand what is meant by 'state' in the context of the web, and be able to explain some techniques that are used to simulate state
* Explain the difference between GET and POST, and know when to choose each
* *Understand the client-server model of web interactions, and the role of HTTP as a protocol within that model*

## HTTP

### What are request methods?

* A request method is part of the _request line_ of an HTTP request and it describes the type of request that is being made
* For example, a `GET` request might be made oto fetch a certain resource and a `POST` request might be made to send some data to the server

___

* Verb command that tells the server what action it should preform on a resource
* a `GET` request is used to *retrieve* a resource on the server
* a `POST` request is used to send data and *create/update* a resource on the server
  * Sending a username/password is creating a session (which is a resource)

### Describe statelessness and its trade offs

* stateful web application maintains knowledge of past interactions
  * reddit
  * shopping carts
* HTTP is a stateless protocol — each request/response cycle is independent of one other
  * each cycle has no effect on the preceding or subsequent cycles
* stateless protocols are resilient and fast
  * server doesn't have to retain any information between each request/response cycle (resilience)
  * no part of the system has to do any clean up (speed)
* it's very hard to simulate a stateful experience

### What are mechanisms that are used to simulate state?

* **Sessions** - a means of identifying a specific client to a server so that it can be made to _seem_ a persistent connection exists between HTTP requests/responses
  * The server assigns some kind of unique `session id` to the client.
  * Then, the client includes that `session id` in each request it makes, this allows the server to identify individual clients, preserving data associated with each identity.
  * CONS:
    * Difficult to maintain
    * because each HTTP request must be analyzed for a `session id`
    * each `session id` has to be validated
    * server needs to figure out how to handle invalid ids
    * how to store and retrieve data associated with each `session id`
    * server needs to recreate the state from whatever data it has stored when sending back a response

* **Cookies** - a way for the browser (client) to store data sent from the server that helps maintain the appearance of persistent application state.
  * Small files stored in the browser that contain information about the `session id`.
  * These files are stored even if the browser is closed or shut down, which enables a longer and more consistent appearance of state.
  * This information is sent with each request to the server, then used to "unlock" the correct stored session data
  * Allows the server to recreate the correct state of the application
  * Allows the session to be recognized each time a website is visited, even if some time has passed.

* **AJAX** - **Asynchronous JavaScript and XML**
  * What allows browsers to issue requests and process responses without having to refresh the current page
  * AJAX requests are sent like normal HTTP requests, and the server responds to them with a normal HTTP response
  * BUT the browser will process these responses with a _callback function_ rather than refreshing and processing the HTTP response
  * Allows the client to send and retrieve information is small pieces that can be used to update the state of an application without reloading the whole complicated thing (easier to maintain state)
  
### Is HTTP secure? Why or why not?

* HTTP is not secure because they are essentially text-based messages
* Because they are insecure, attackers can employ techniques like packet sniffing to obtain information
* Using HTTPS, which utilizes TLS to ensure a secure connection helps with this

### What is session hijacking? What measures can be taken to prevent this?

* **Session Hijacking** is a malignant action in which a hacker utilizes a stolen `session id` to authenticate themselves and share sessions.
* Because a client's individual `session id` is used to log a user in, gaining access to this can allow a hacker to log in as the user without ever having to know their username or password.
* Prevention measures:
  * Can be mitigates by frequently resetting session (i.e. making sure users re-authenticate when doing anything sensitive)
  * Putting an expiration time on sessions to give attackers a narrower window for access

### What are some other ways to mitigate the lack of security in HTTP?

* Designing for the **same origin policy**
  * Same-origin policy permits interactions between resources of the same origin, but restricts certain interactions between resources of different origins
  * 'Same-origin' means same scheme, host, and port
  * This prevents attackers from using this mechanism to access session information, or other sensitive information
* Protecting against **cross site scripting (XSS)**
  * When a malicious party uses site input fields to inject HTML or JavaScript into the site directly
  * This can be prevented by performing _input sanitation_, bu getting rid of anything that might be problematic like `<script>` tags.
  * Escape certain characters that indicate JavaScript or HTML code
  
## TLS

### Topics of interest

* Be aware of the different services that TLS can provide, and have a broad understanding of each of those services

### What is the TLS protocol, and what is its purpose?

* TLS = **Transport Layer Security**
* It is a protocol that utilizes cryptography to provide more secure communications between networked applications.
* It is that which provides the security aspect of HTTPS
* It consists of both the TLS record and the TLS handshake

Why do we need TLS:

* Because HTTP is a text based protocol, it is inherently insecure.
* Any intercepted requests/responses are easy to read. Furthermore, HTTP is a fairly simple protocol, concerned only with basic message structure.
* It provides no check for whether or not the source of an HTTP response is trustworthy, nor does it provide a means of determining if messages are being tampered with in transit.

Purpose:

* TLS enables us to provide encryption to the inherently insecure plain text of the HTTP protocol
* Provides authentication services, checking to see if the source of an HTTP response is trustworthy
* Provides a means of ensuring data integrity, that is, determining whether or not HTTP messages have been tampered with

___

* Exists between protocols of the Application layer and Transport layer

### What are the three services that TLS provides? Describe each

* Encryption allows HTTP messages to be encoded in such a way that only the intended recipient can decode the message
  * This secure channel is established with the TLS handshake, which uses both symmetric and asymmetric key encryption
  * It encrypts, but adds several round-trips of latency which impacts performance
* Authentication is a means of verifying the identity of the participant in a message exchange, to ensure the source of an HTTP response is trustworthy so the provided resource can be safely processed
  * Implemented with Digital Certificates, which are signed by a chain of Certificate Authorities
  * Certificates are exchanged during the TLS handshake
* Integrity ensures that the message hasn't been altered or interfered
  * It is different from checksum, because it is more than just checking for errors (data corruption)
  * It ensures that the message hasn't been tampered with
  * It uses Message Authentication Codes (MAC)

### Give a general overview of the TLS handshake

* The TLS Handshake is a special process that takes place after the TCP Handshake, where client and server exchange encryption keys.
* This exchange allows both parties to communicate via encrypted messages, thus giving a security advantage over the inherently insecure messages of HTTP
* The encryption key exchange is accomplished via asymmetric key encryption.
* Once the encryptions keys are exchanged in the handshake, communication via symmetric encryptions between the client and the server can commence.
* The TLS handshake also provides a means by which the two devices can decide on which TLS version should be used for the connection, as well as which algorithms should be used in the cipher suite.
* The TLS Handshake consists of the following steps:
  * `ClientHello` = client sends the max version of TLS protocol it supports and a list of available cipher suites
  * `ServerHello` = server responds with a decision re: TLS version and cipher suite. Includes its certificate and public key. Ends with `ServerHelloDone` marker
  * Client initiates symmetric key exchange process, using the server's public key for asymmetric key encryption
  * Once the keys have been exchanged, the server sends a ready-to-go message using the symmetric key and secure message exchange commences.
* Because the TLS handshake is a complex process that can add two RTT it has an impact on speed and performance.

### What is Symmetric Key Encryption? What is Asymmetric Key Encryption? What are the advantages and drawbacks of each?

* Symmetric key encryption is when the sender and receiver share a common encryption key
  * Advantage: provides for secure two-way communication
  * Drawback: they need to find a way to securely exchange symmetric keys, which isn't always easy over the internet
* Asymmetric key encryption uses a pair of keys: a public key and a private key.
* They are non-identical and the public key is used to encrypt and the private key is used to decrypt
  * Advantage: securely exchange symmetric keys
  * Drawback: only facilitates one way communication

### What is a cipher suite?

* A **cipher suite** is the set of _ciphers_ (i.e. cryptographic algorithms) that are used for encryption, decryption, and other security tasks.
* In general, we want to have a distinct algorithm (cipher) for each task during secure communication
* This might include performing the key exchange, symmetric key encryption, and checking message integrity
* Hosts agree on a cipher suite they will use during secure communication during the TLS handshake process

### How does TLS Authentication work?

* TLS authentication is a means of verifying the identify of the sender of the message
* It uses digital certificates, which are provided by the server during the TLS handshake
* The certificate includes a Public Key, and a signature (data encrypted with the private key), and the original data that was used to create the signature
* Upon receipt, the receiver decrypts the signature with the public key and checks that it matches the original data
* The certificate that the server sends is signed by Certificate Authorities, to verify that the party is who they say they are
* The digital certificate the server provides is considered to be trustworthy on the basis of the issuing certificate authority.

### What are Certificate Authorities and the Chain of Trust?

* Certificate Authorities are trustworthy sources that issue certificates used by servers to establish authentication
* We use certificates provided by these authorities to ensure that the certificate in question (servers) is not being faked
* Certificate authorities exist in a hierarchy known as the "chain of trust"
* Within this hierarchy, the certificate for lower level authorities is signed by the CA one level above it
* At the top of the chain there exists a Root CA whose certificate is "self-signed"
* These consists of a small group of organizations who have proved their high level trustworthiness through prominence and longevity.

### How does TLS Integrity work?

* TLS integrity makes sure that a message hasn't been altered with or interfered with during transit
* This is done with the Message Authentication Code (MAC)
* Sender creates a digest of the data payload with a hashing algorithm (pre-agreed upon in the TLS handshake)
* Encrypt this data with the symmetric key and sends it to the receiver
* Receiver decrypts the data with the symmetric key, creates a digest with the same pre-agreed upon hashing algorithm, and checks if the two match

___

* Data that is being exchanged via HTTP is encapsulated into a PDU (record) for TLS
* The relevant metadata here is the MAC, which is how the protocol checks to see if the message is still good

### What is DTLS and why do we need it?

* **Datagram Transport Layer Security**
* A separate protocol _based on_ TLS that is used with network connections that utilize UDP instead of TCP
* Because TLS is interlinked with TCP and the TCP handshake, separate protocols are needed to meet the security requirements of UDP