\\ acceleration.gp
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com
\\
\\ http://cocoawithlove.com/2008/09/parametric-acceleration-curves-in-core.html

print_plot(title, f) = print(title); plot(x=1, 100, f(x/100))

Bezier(t) = {
  3 * t * (1 - t) * (1 - t) * FirstControlPoint +
  3 * t * t * (1 - t) * SecondControlPoint +
  t * t * t * 1.0
}

ExponentialDecay(t) = {
  offset = exp(-Coeff);
  scale = 1.0 / (1.0 - offset);
  1.0 - scale * (exp(t * -Coeff) - offset)
}

SecondOrderSystemResponse(t) = {
  beta = sqrt(1 - Zeta * Zeta);
  phi = atan(beta / Zeta);
  1.0 + -1.0 / beta * exp(-Zeta * Omega * t) * sin(beta * Omega * t + phi)
}

FirstControlPoint = 1.0 / 3.0
SecondControlPoint = 2.0 / 3.0
print_plot("Linear", Bezier)

FirstControlPoint = 0.0
SecondControlPoint = 1.0
print_plot("Ease In, Ease Out", Bezier)

FirstControlPoint = 0.0
SecondControlPoint = 1.0 / 3.0
print_plot("Quadratic acceleration", Bezier)

Coeff = 6.0
print_plot("Exponential Decay", ExponentialDecay)

Omega = 20.0
Zeta = 0.33
print_plot("Second Order System Response", SecondOrderSystemResponse)

quit
