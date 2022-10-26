# [42 | São Paulo](https://42sp.org.br)

## minitalk

---

## About project

In this project I needed undestood the **Unix Signals** and **Bitwise Operators**.

The purpose is create **client** and **server** programs and they must communicate each other.

## How to use

Clone the repository and run Makefile

> `make`

Run server

> `./server`

The server shows the Process ID (PID)

> `$ ./server`  
> `0000`

In another terminal window run client with PID and string arguments

> `./client PID STRING`  
> `$ ./client 0000 "Hello World"`

If the message has sent succesfully the client shows "Message Sent"

> `./client 0000 "Hello World"`  
> `Message Sent`

Alternaly you can run the server in background to execute client in the same terminal window

> `./server &`

---

## Reference links

- https://www.gnu.org/software/libc/manual/html_node/Signal-Handling.html
- https://pubs.opengroup.org/onlinepubs/7908799/xsh/unistd.h.html
- https://www.tutorialspoint.com/c_standard_library/c_function_signal.htm
- https://linuxhint.com/signal_handlers_c_programming_language/
- https://pubs.opengroup.org/onlinepubs/000095399/basedefs/signal.h.html
- https://www.youtube.com/c/CodeVault/playlists
- https://www.youtube.com/watch?v=CKNjXvMB0MY&list=PLypxmOPCOkHXbJhUgjRaV2pD9MJkIArhg
- https://www.tutorialspoint.com/cprogramming/c_operators.htm