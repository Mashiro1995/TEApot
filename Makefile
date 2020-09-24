all: libcache/get libpte/mod meltdowns spectres

meltdowns: AC BR DE GP NM P PK RW SS UD US

spectres: BTBs RSBs PHTs STL

BTBs: BTB_ca_ip BTB_ca_oop BTB_sa_ip BTB_sa_oop

RSBs: RSB_ca_ip RSB_ca_oop RSB_sa_ip RSB_sa_oop

PHTs: PHT_ca_ip PHT_ca_oop PHT_sa_ip PHT_sa_oop

STL:


libcache/get: 
	cd libcache && make

libpte/mod:
	cd libpte && make

AC:
	cd meltdown/AC && make x86

BR:
	cd meltdown/BR && make x86

DE:
	cd meltdown/DE && make x86

GP:
	cd meltdown/GP && make x86

NM:
	cd meltdown/NM && make x86

P:
	cd meltdown/P && make x86

PK:
	cd meltdown/PK && make x86

RW:
	cd meltdown/RW && make x86

SS:
	cd meltdown/SS && make x86

UD:
	cd meltdown/UD && make x86

US:
	cd meltdown/US && make x86

BTB_ca_ip:
	cd spectre/BTB/ca_ip && make x86

BTB_ca_oop:
	cd spectre/BTB/ca_oop && make

BTB_sa_ip:
	cd spectre/BTB/sa_ip && make x86

BTB_sa_oop:
	cd spectre/BTB/sa_oop && make x86

RSB_ca_ip:

RSB_ca_oop:

RSB_sa_ip:

RSB_sa_oop:

PHT_ca_ip:

PHT_ca_oop:

PHT_sa_ip:

PHT_sa_oop:

clean:
	cd libcache && make clean
	cd libpte && make clean
	cd meltdown/AC && make clean
	cd meltdown/BR && make clean
	cd meltdown/DE && make clean
	cd meltdown/GP && make clean
	cd meltdown/NM && make clean
	cd meltdown/P && make clean
	cd meltdown/PK && make clean
	cd meltdown/RW && make clean
	cd meltdown/SS && make clean
	cd meltdown/UD && make clean
	cd meltdown/US && make clean
	cd spectre/BTB/ca_ip && make clean
	cd spectre/BTB/ca_oop && make clean
	cd spectre/BTB/sa_ip && make clean
	cd spectre/BTB/sa_oop && make clean