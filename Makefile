## MAKEFILE FOR RascalC. This compiles the grid_covariance.cpp file into the ./cov exececutable.

CC = gcc
CFLAGS = -O3 -Wall
CXXFLAGS = -O3 -Wall -DOPENMP 
# disable OPENMP to run single threaded
#-DPERIODIC # use this to enable periodic behavior

CXX = g++ -fopenmp -lgomp -std=c++0x -ffast-math

AUNTIE	= cov
AOBJS	= grid_covariance.o ./cubature/hcubature.o ./ransampl/ransampl.o

LD	= g++
LFLAGS	= -L/usr/local/lib -L/usr/lib/x86_64-linux-gnu -lgsl -lgslcblas -lgomp


main: $(AUNTIE)

$(AUNTIE):	$(AOBJS)
	$(LD) $(AOBJS) $(LFLAGS) -o $(AUNTIE)

clean:
	rm grid_covariance 
