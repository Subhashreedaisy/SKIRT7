/*//////////////////////////////////////////////////////////////////
////       SKIRT -- an advanced radiative transfer code         ////
////       © Astronomical Observatory, Ghent University         ////
///////////////////////////////////////////////////////////////// */

#include "FatalError.hpp"
#include "SymPowMesh.hpp"
#include "NR.hpp"

using namespace std;

////////////////////////////////////////////////////////////////////

SymPowMesh::SymPowMesh()
    : _ratio(0)
{
}

////////////////////////////////////////////////////////////////////

void SymPowMesh::setupSelfBefore()
{
    MoveableMesh::setupSelfBefore();
    if (_ratio<=0) throw FATALERROR("the bin width ratio should be positive");
}

////////////////////////////////////////////////////////////////////

void SymPowMesh::setRatio(double value)
{
    _ratio = value;
}

////////////////////////////////////////////////////////////////////

double SymPowMesh::ratio() const
{
    return _ratio;
}

////////////////////////////////////////////////////////////////////

Array SymPowMesh::mesh() const
{
    Array tv;
    if (numBins()>2) NR::sympowgrid(tv, 0.0, 1.0, numBins(), _ratio);
    else NR::lingrid(tv, 0.0, 1.0, numBins());
    return tv;
}

//////////////////////////////////////////////////////////////////////