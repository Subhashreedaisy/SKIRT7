/*//////////////////////////////////////////////////////////////////
////       SKIRT -- an advanced radiative transfer code         ////
////       © Astronomical Observatory, Ghent University         ////
///////////////////////////////////////////////////////////////// */

#include <cmath>
#include <cstdlib>
#include "FatalError.hpp"
#include "NR.hpp"
#include "SersicFunction.hpp"
#include "SpecialFunctions.hpp"

using namespace std;

//////////////////////////////////////////////////////////////////////

SersicFunction::SersicFunction(double n)
{
    if (n<0.5 || n>10.0)
        throw FATALERROR("The Sersic parameter should be between 0.5 and 10 (n = " + QString::number(n) + ")");
    double b = 2.0*n - 1.0/3.0 + 4.0/405.0/n + 46.0/25515.0/(n*n) + 131.0/1148175.0/(n*n*n);
    double I0 = pow(b,2.0*n) / (M_PI*SpecialFunctions::gamma(2.0*n+1));
    int Ns = 101;
    _sv.resize(Ns);
    _Sv.resize(Ns);
    _Mv.resize(Ns);
    double logsmin = -6.0;
    double logsmax = 4.0;
    double dlogs = (logsmax-logsmin)/(Ns-1.0);
    for (int i=0; i<Ns; i++)
    {
        double logs = logsmin + i*dlogs;
        double s = pow(10.0,logs);
        _sv[i] = s;
        double alpha = b*pow(s,1.0/n);
        double sum = 0.0;
        int Nu = 10000;
        double tmax = 100.0;
        double umax = sqrt((tmax+1.0)*(tmax-1.0));
        double du = umax/Nu;
        for (int j=0; j<=Nu; j++)
        {
            double weight = 1.0;
            if (j==0 || j==Nu) weight=0.5;
            double u = j*du;
            double u2 = u*u;
            double w;
            if (u>1e-3)
                w = (pow(1.0+u2,2.0*n)-1.0)/u2;
            else
                w = 2.0*n + n*(2.0*n-1.0)*u2 + 2.0/3.0*n*(2.0*n-1.0)*(n-1.0)*u2*u2;
            double integrandum = 2.0*exp(-alpha*(1.0+u2))/sqrt(w);
            sum += weight*integrandum;
        }
        _Sv[i] = I0 * pow(b,n) * pow(alpha,1.0-n) / M_PI * du * sum;
    }

    // calculate the cumulative mass

    for (int i=1; i<Ns; i++)
    {
        double sum = 0.0;
        for (int j=0; j<=32; j++)
        {
            double weight=1.0;
            if (j==0 || j==32) weight=0.5;
            double ds = (_sv[i]-_sv[i-1])/32.0;
            double s = _sv[i-1] + j*ds;
            double S = operator()(s);
            sum += weight*S*s*s*ds;
        }
        double dM = 4.0 * M_PI * sum;
        _Mv[i] = _Mv[i-1] + dM;
    }
    for (int i=0; i<Ns; i++) _Mv[i] /= _Mv[Ns-1];
}

//////////////////////////////////////////////////////////////////////

double SersicFunction::operator() (const double s) const
{
    int Ns = _sv.size();
    if (s <= _sv[0])
        return _Sv[0];
    else if (s >= _sv[Ns-1])
        return _Sv[Ns-1];
    else
    {
        int i = NR::locate_clip(_sv,s);
        return NR::interpolate_loglog(s, _sv[i], _sv[i+1], _Sv[i], _Sv[i+1]);
    }
}

//////////////////////////////////////////////////////////////////////

double SersicFunction::mass(const double s) const
{
    int Ns = _sv.size();
    if (s <= _sv[0])
        return _Mv[0];
    else if (s >= _sv[Ns-1])
        return _Mv[Ns-1];
    else
    {
        int i = NR::locate_clip(_sv,s);
        return NR::interpolate_loglog(s, _sv[i], _sv[i+1], _Mv[i], _Mv[i+1]);
    }
}

//////////////////////////////////////////////////////////////////////

double SersicFunction::inversemass(const double M) const
{
    int Ns = _sv.size();
    if (M <= _Mv[0])
        return _sv[0];
    else if (M >= _Mv[Ns-1])
        return _sv[Ns-1];
    else
    {
        int i = NR::locate_clip(_Mv,M);
        return NR::interpolate_loglog(M, _Mv[i], _Mv[i+1], _sv[i], _sv[i+1]);
    }
}

//////////////////////////////////////////////////////////////////////
