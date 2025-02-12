Notes
=====

Hi! I needed a small web server for my router without any bells and whistles. Actually, I found it by trial and error, I am completely satisfied, sharing.

Read more.

The historical line of borrowings, as I understand it, is as follows.

Feng Shen (shenfeng) -> John M. Jones (jmjatlanta) -> I

To be honest, I didn't change anything fundamentally in the source code. I returned the ability to use in a local network, as it was in the source. The rest of the improvements made by John M. Jones (jmjatlanta) remained unchanged.

I have achieved the binary (executable) file size optimization parameters in 8 kB. Admittedly, that's pretty small by today's standards, but it's almost certainly bigger than it needs to be. 

If you can do better, please tell me how.

PS. 
With the help of tools ELFkickers from Brian Raiter, we were able to achieve the size - 6732 byte.

Example of use: ./tiny <dir_www> <port>			// port default to 8080

Repository used: entware - mipssf-k3.4

Useful link: 
[3.20.29 MIPS Options](https://gcc.gnu.org/onlinedocs/gcc/MIPS-Options.html)
[Kickers of ELF](https://www.muppetlabs.com/~breadbox/software/elfkickers.html)


ASUS RT-AC57U v3
cat /proc/cpuinfo
system type		: Qualcomm Atheros QCA5502 rev 0
machine			: Qualcomm Atheros APJET01 reference board
processor		: 0
cpu model		: MIPS 74Kc V5.0
BogoMIPS		: 385.84
wait instruction	: yes
microsecond timers	: yes
tlb_entries		: 32
extra interrupt vector	: yes
hardware watchpoint	: yes, count: 4, address/irw mask: [0x0000, 0x0d60, 0x0788, 0x0238]
ASEs implemented	: mips16 dsp
shadow register sets	: 1
kscratch registers	: 0
core			: 0
VCED exceptions		: not available
VCEI exceptions		: not available

John's Notes
============

I modified it to not do a directory listing. Instead, I tack on index.html. I also
got rid of some compiler warnings.

A tiny web server in C
======================

I am reading
[Computer Systems: A Programmer's Perspective](http://csapp.cs.cmu.edu/).
It teachers me how to write a tiny web server in C.

I have written another
[tiny web server](https://github.com/shenfeng/nio-httpserver) in JAVA.

And another one [http-kit](https://github.com/http-kit/http-kit), http-kit is full featured, with websocket and async support

And few others on my github page.

Features
--------

1. Basic MIME mapping
2. Very basic directory listing
3. Low resource usage
4. [sendfile(2)](http://kernel.org/doc/man-pages/online/pages/man2/sendfile.2.html)
5. Support Accept-Ranges: bytes (for in browser MP4 playing)
6. Concurrency by pre-fork

Non-features
------------

1. No security check

Usage
-----

`tiny <port>`, opens a server in the current directory, port
default to 9999, just like `python -m SimpleHTTPServer`

I use it as a lightweight File Browser.


TODO
----

1. Write a epoll version


License
-------

The code is free to use under the terms of the MIT license.
