ary = eval(read("rules/.pol"))
pri = read("rules/.pri")
xa = apply(a->a[1], ary)
ya = apply(a->a[2], ary)
pol = x->polinterpolate(xa,ya,x)
print1(if(pri=="함수",pol(x), \
       if(pri=="역함수",polinterpolate(ya,xa,x), \
                        pol(eval(pri)))))
quit