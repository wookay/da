\\ polynomial.gp
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com
\\
\\ http://en.wikipedia.org/wiki/Polynomial

print_plot(x1, x2, f) = {
  print("f", f, " = ", f(x));
  plot(X=x1, x2, f(X));
  print("\n");
}

print_plot(-4   , 5   , x-> (x+1)*(x-2)                            )
print_plot(-6   , 4   , x-> 1/5*(x+5)*(x+1)*(x-2)                  )
print_plot(-5   , 4   , x-> 1/14*(x+4)*(x+1)*(x-1)*(x-3) + 0.5     )
print_plot(-4.5 , 3.3 , x-> 1/20*(x+4)*(x+2)*(x+1)*(x-1)*(x-3) + 2 )

quit
