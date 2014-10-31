/*//////////////////////////////////////////////////////////////////
////       SKIRT -- an advanced radiative transfer code         ////
////       © Astronomical Observatory, Ghent University         ////
///////////////////////////////////////////////////////////////// */

#include "FitScheme.hpp"

#include "Console.hpp"
#include "FatalError.hpp"
#include "FilePaths.hpp"
#include "MasterSlaveCommunicator.hpp"
#include "Optimization.hpp"
#include "SIUnits.hpp"
#include "TimeLogger.hpp"

////////////////////////////////////////////////////////////////////

FitScheme::FitScheme()
{
    _paths = new FilePaths();
    _paths->setParent(this);
    _log = new Console();
    _log->setParent(this);
    _communicator = new MasterSlaveCommunicator();
    _communicator->setParent(this);
    _units = new SIUnits();
    _units->setParent(this);
    _parallelSimulations = 1;
    _parallelThreads = 0;
}

////////////////////////////////////////////////////////////////////

void FitScheme::setup()
{
    if (_state > Created) return;

    // ensure the log has been setup before using it
    _log->setup();

    TimeLogger logger(_log, "setup");
    SimulationItem::setup();
}

////////////////////////////////////////////////////////////////////

void FitScheme::run()
{
    // verify setup
    if (_state < SetupDone) throw FATALERROR("Fit scheme has not been setup before being run");

    _communicator->acquireSlaves();
    if(_communicator->isMaster())
    {
        TimeLogger logger(_log, "fitting");
        runSelf();
    }
    _communicator->releaseSlaves();
}

////////////////////////////////////////////////////////////////////

void FitScheme::setupAndRun()
{
    _log->setup(); // ensure the log is properly setup before first use

    QString processInfo = _communicator->isMultiProc() ? " with " + QString::number(_communicator->getSize()) + " processes" : "";
    TimeLogger logger(_log, "fit scheme " + _paths->outputPrefix() + processInfo);

    setup();
    run();
}

////////////////////////////////////////////////////////////////////

void FitScheme::setFilePaths(FilePaths* value)
{
    if (_paths) delete _paths;
    _paths = value;
    if (_paths) _paths->setParent(this);
}

////////////////////////////////////////////////////////////////////

FilePaths* FitScheme::filePaths() const
{
    return _paths;
}

////////////////////////////////////////////////////////////////////

void FitScheme::setLog(Log* value)
{
    if (_log) delete _log;
    _log = value;
    if (_log) _log->setParent(this);
}

////////////////////////////////////////////////////////////////////

Log* FitScheme::log() const
{
    return _log;
}

////////////////////////////////////////////////////////////////////

void FitScheme::setUnits(Units *value)
{
    if (_units) delete _units;
    _units = value;
    if (_units) _units->setParent(this);
}

////////////////////////////////////////////////////////////////////

Units *FitScheme::units() const
{
    return _units;
}

////////////////////////////////////////////////////////////////////

void FitScheme::setParallelSimulationCount(int value)
{
    _parallelSimulations = value;
}

////////////////////////////////////////////////////////////////////

int FitScheme::parallelSimulationCount() const
{
    return _parallelSimulations;
}

////////////////////////////////////////////////////////////////////

void FitScheme::setParallelThreadCount(int value)
{
    _parallelThreads = value;
}

////////////////////////////////////////////////////////////////////

int FitScheme::parallelThreadCount() const
{
    return _parallelThreads;
}

////////////////////////////////////////////////////////////////////
