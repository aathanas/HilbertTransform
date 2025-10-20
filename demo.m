clc; close all; clear all;


x=linspace(-20,20,134);
% output grid where we want the values of the computed Hilbert transform

f1= @(x) sin(x) ./ x;
% formula of the original function

f1_exact_hilbert = @(x) ( 1-cos(x) ) ./ x;
% formula of the exact Hilbert transform, for validation

tol = 1e-5;
% pointwise error tolerance to aim for


tic
[h,xquad] = AdaptiveSpectralHilbertTransform(f1, x, tol);
computation_time=toc;

hext = f1_exact_hilbert(x);
fxqd=f1(xquad);
N=length(xquad);


figure(Units="normalized",Position=[0.1 0.1 0.8 0.7])
subplot(4,1,1)
plot(x,f1(x))
xl=xlim;
yl=ylim;
hold on
plot(xquad,fxqd,'r*')

lgd = legend('Original function, $\sin(x)/x$','Quadrature points');
lgd.Interpreter = 'latex';
xlim(xl);
ylim(yl);
grid on
xlabel('Quadrature points used, local view')
set(gca,'Fontsize',19)

subplot(4,1,2)
plot(x,f1(x))
hold on
plot(xquad,fxqd,'r*')
legend('Original function','Quadrature points')
xlabel('Quadrature points used, global view')
grid on
set(gca,'Fontsize',19)

subplot(4,1,3)
plot(x,hext)
hold on
grid on
plot(x,real(h));
plot(x,imag(h));
plot(x,hext,'k*')
lgd = legend('exact Hilbert transform $(1-\cos(x))/x$','numerical approximation (real part)','numerical approximation (imag part)','output grid points',Location='southeast');
lgd.Interpreter = 'latex';
xlabel([num2str(N) ' quadrature points used to acieve ' num2str(tol) ' pointwise error tolerance in ' num2str(computation_time) ' seconds'])
set(gca,'Fontsize',19)

subplot(4,1,4)
plot(x,abs(hext - h))
xlabel('Numerical error (modulus)')
set(gca,'Fontsize',19)

set(gcf, "Theme", "light");