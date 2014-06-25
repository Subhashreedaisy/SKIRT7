/*//////////////////////////////////////////////////////////////////
////       SKIRT -- an advanced radiative transfer code         ////
////       © Astronomical Observatory, Ghent University         ////
//////////////////////////////////////////////////////////////////*/

#include "EnstatiteGrainComposition.hpp"

//////////////////////////////////////////////////////////////////////

EnstatiteGrainComposition::EnstatiteGrainComposition()
{
}

//////////////////////////////////////////////////////////////////////

void EnstatiteGrainComposition::setupSelfBefore()
{
    setBulkDensity(2.80e3);
    loadLogHeatCapacityGrid("GrainComposition/DustEM/hcap/C_aSil.DAT");
    loadOpticalGrid("GrainComposition/Min/Enstatite_Jaeger1998.dat", false, false, false, false);
}

//////////////////////////////////////////////////////////////////////

QString EnstatiteGrainComposition::name() const
{
    return "Enstatite";
}

//////////////////////////////////////////////////////////////////////
