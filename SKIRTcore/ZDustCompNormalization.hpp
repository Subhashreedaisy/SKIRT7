/*//////////////////////////////////////////////////////////////////
////       SKIRT -- an advanced radiative transfer code         ////
////       © Astronomical Observatory, Ghent University         ////
///////////////////////////////////////////////////////////////// */

#ifndef ZDUSTCOMPNORMALIZATION_HPP
#define ZDUSTCOMPNORMALIZATION_HPP

#include "DustCompNormalization.hpp"

//////////////////////////////////////////////////////////////////////

/** ZDustCompNormalization is a class that sets the normalization of a general 3D dust component by
    defining the Z-axis optical depth at an arbitrary wavelength. The Z-axis optical depth is
    defined as the integral of the opacity along the entire Z-axis, \f[
    \tau_\lambda^{\text{Z}} = \int_{-\infty}^\infty k_\lambda(0,0,z)\, {\text{d}}z. \f] */
class ZDustCompNormalization : public DustCompNormalization
{
    Q_OBJECT
    Q_CLASSINFO("Title", "normalization by defining the Z-axis optical depth at some wavelength")

    Q_CLASSINFO("Property", "wavelength")
    Q_CLASSINFO("Title", "the wavelength at which to specify the optical depth")
    Q_CLASSINFO("Quantity", "wavelength")
    Q_CLASSINFO("MinValue", "1 A")
    Q_CLASSINFO("MaxValue", "1 m")

    Q_CLASSINFO("Property", "opticalDepth")
    Q_CLASSINFO("Title", "the Z-axis optical depth at this wavelength")
    Q_CLASSINFO("MinValue", "0")

    //============= Construction - Setup - Destruction =============

public:
    /** The default constructor. */
    Q_INVOKABLE ZDustCompNormalization();

protected:
    /** This function verifies that the dust mass has been appropriately set. */
    void setupSelfBefore();

    //======== Setters & Getters for Discoverable Attributes =======

public:
    /** This function sets the wavelength at which the optical depth is defined for normalizing the
        dust component. */
    Q_INVOKABLE void setWavelength(double value);

    /** This function returns the wavelength at which the optical depth is defined for normalizing
        the dust component. */
    Q_INVOKABLE double wavelength() const;

    /** This function sets the optical depth used for normalizing the dust component. */
    Q_INVOKABLE void setOpticalDepth(double value);

    /** This function returns the optical depth used for normalizing the dust component. */
    Q_INVOKABLE double opticalDepth() const;

    //======================== Other Functions =======================

public:
    /** This function returns the appropriate normalization factor for the specified
        geometry and dust mixture. */
    double normalizationFactor(const Geometry* geom, const DustMix* mix) const;

    //======================== Data Members ========================

private:
    double _wavelength;
    double _tau;
};

//////////////////////////////////////////////////////////////////////

#endif // ZDUSTCOMPNORMALIZATION_HPP
