/*//////////////////////////////////////////////////////////////////
////       SKIRT -- an advanced radiative transfer code         ////
////       © Astronomical Observatory, Ghent University         ////
//////////////////////////////////////////////////////////////////*/

#include "ForsteriteGrainComposition.hpp"

//////////////////////////////////////////////////////////////////////

ForsteriteGrainComposition::ForsteriteGrainComposition()
{
}

//////////////////////////////////////////////////////////////////////

void ForsteriteGrainComposition::setupSelfBefore()
{
    setBulkDensity(3.33e3);
    loadLogHeatCapacityGrid("GrainComposition/DustEM/hcap/C_aSil.DAT");
    loadOpticalGrid("GrainComposition/Min/Forsterite_Suto2006.dat", false, false, false, false);
}

//////////////////////////////////////////////////////////////////////

QString ForsteriteGrainComposition::name() const
{
    return "Forsterite";
}

//////////////////////////////////////////////////////////////////////
