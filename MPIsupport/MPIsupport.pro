#-------------------------------------------------
#  SKIRT -- an advanced radiative transfer code
#  © Astronomical Observatory, Ghent University
#-------------------------------------------------

#---------------------------------------------------------------------
# This library encapsulates any and all MPI-related functionality used
# by SKIRT and FitSKIRT. Concentrating all MPI calls in this library
# allows all other code to be compiled without the MPI extra's.
#---------------------------------------------------------------------

# overall setup
TEMPLATE = lib
TARGET = mpisupport
QT -= gui
CONFIG *= staticlib create_prl thread c++11

macx {
    INCLUDEPATH += /usr/local/include
    LIBS += -L/usr/local/lib/ -lmpi
}

# compile with maximum optimization
QMAKE_CXXFLAGS_RELEASE -= -O2
QMAKE_CXXFLAGS_RELEASE += -O3

# use MPI compiler if available (invoke 'which' via bash in login script mode to honor PATHS on Mac OS X)
MPI_COMPILER = $$system(bash -lc "'which mpiicpc'")
isEmpty(MPI_COMPILER) {
    MPI_COMPILER = $$system(bash -lc "'which mpicxx'")
}
!isEmpty(MPI_COMPILER) {
    message (using MPI compiler $$MPI_COMPILER)
    QMAKE_CXXFLAGS += -DBUILDING_WITH_MPI
    QMAKE_CXX = $$MPI_COMPILER
}

#--------------------------------------------------
# source and header files: maintained by Qt creator
#--------------------------------------------------

HEADERS += \
    ProcessManager.hpp

SOURCES += \
    ProcessManager.cpp
