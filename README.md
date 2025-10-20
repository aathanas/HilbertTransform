# HilbertTransform
Adaptive spectral approximation of the continuous Hilbert transform using Weideman's rational eigenfunction expansion


hilb1.m computes an approximation using fixed sampling points. 
It is modified from [https://appliedmaths.sun.ac.za/~weideman/research/hilbert.html] with permission from the author. (A sign convention has been changed to agree with the most common normalization of the Hilbert transform.)

AdaptiveSpectralHilbertTransform.m keeps extending and refining the sampling points until a specified error tolerance is met.
