% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulate_basicmodel_fit.R
\name{simulate_basicmodel_fit}
\alias{simulate_basicmodel_fit}
\title{Fitting a simple viral infection models to influenza data}
\usage{
simulate_basicmodel_fit(U = 1e+05, I = 0, V = 1, X = 1, n = 0,
  dU = 0, dI = 1, g = 1, p = 10, plow = 0.001, phigh = 1000,
  psim = 10, b = 1e-05, blow = 1e-06, bhigh = 0.001,
  bsim = 1e-04, dV = 2, dVlow = 0.001, dVhigh = 1000, dVsim = 10,
  usesimdata = TRUE, noise = 0.001, iter = 100, solvertype = 1)
}
\arguments{
\item{U}{initial number of uninfected target cells}

\item{I}{initial number of infected target cells}

\item{V}{initial number of infectious virions}

\item{X}{initial level of immune response}

\item{n}{rate of uninfected cell production}

\item{dU}{rate at which uninfected cells die}

\item{dI}{rate at which infected cells die}

\item{g}{unit conversion factor}

\item{p}{rate at which infected cells produce virus}

\item{plow}{lower bound for p}

\item{phigh}{upper bound for p}

\item{psim}{rate at which infected cells produce virus for simulated data}

\item{b}{rate at which virus infects cells}

\item{blow}{lower bound for infection rate}

\item{bhigh}{upper bound for infection rate}

\item{bsim}{rate at which virus infects cells for simulated data}

\item{dV}{rate at which infectious virus is cleared}

\item{dVlow}{lower bound for virus clearance rate}

\item{dVhigh}{upper bound for virus clearance rate}

\item{dVsim}{rate at which infectious virus is cleared for simulated data}

\item{usesimdata}{set to TRUE if simulated data should be fitted, FALSE otherwise}

\item{noise}{noise to be added to simulated data}

\item{iter}{max number of steps to be taken by optimizer}

\item{solvertype}{the type of solver/optimizer to use, can be 1, 2, or 3. See details below.}
}
\value{
The function returns a list containing as elements the best fit time series data frame, the best fit parameters,
the data and the final SSR
}
\description{
This function runs a simulation of a compartment model
using a set of ordinary differential equations.
The model describes a simple viral infection system.
}
\details{
A simple compartmental ODE model mimicking acute viral infection
is fitted to data.
Data can either be real or created by running the model with known parameters and using the simulated data to
determine if the model parameters can be identified.
The fitting is done using solvers/optimizers from the nloptr package (which is a wrapper for the nlopt library).
The package provides access to a large number of solvers.
Here, we only implement 3 solvers, namely 1 = NLOPT_LN_COBYLA, 2 = NLOPT_LN_NELDERMEAD, 3 = NLOPT_LN_SBPLX
For details on what those optimizers are and how they work, see the nlopt/nloptr documentation.
}
\section{Warning}{
 This function does not perform any error checking. So if
  you try to do something nonsensical (e.g. specify negative parameter or starting values,
  the code will likely abort with an error message.
}

\examples{
# To run the code with default parameters just call the function:
\dontrun{result <- simulate_basicmodel_fit()}
# To apply different settings, provide them to the simulator function, like such:
result <- simulate_basicmodel_fit(iter = 5)
}
\seealso{
See the Shiny app documentation corresponding to this
function for more details on this model.
}
\author{
Andreas Handel
}
