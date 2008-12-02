\\ math.vector.gp
\\                           wookay.noh at gmail.com

Vector(V) = {
  m->apply(v->eval(Str(vector_, m))(v[1],v[2],v[3]), [V])[1]
}

vector_x(x, y, z) = x
vector_y(x, y, z) = y
vector_z(x, y, z) = z
vector_to_s(x, y, z) = Str([x, y, z])
vector_length_(x, y, z) = sqrt(x*x + y*y + z*z)
vector_normalize(x, y, z) = {
 l = vector_length_(x, y, z);
 [x/l, y/l, z/l]
}

Length(V) = {
 x = V[1]; y = V[2]; z = V[3];
 sqrt(x*x + y*y + z*z)
}
 
Normalize(V) = {
 x = V[1]; y = V[2]; z = V[3];
 l = Length(V);
 [x/l, y/l, z/l]
}

DotProduct(V, W) = {
 vx = V[1]; vy = V[2]; vz = V[3];
 wx = W[1]; wy = W[2]; wz = W[3];
 vx * wx + vy * wy + vz * wz
}

CrossProduct(V, W) = {
 vx = V[1]; vy = V[2]; vz = V[3];
 wx = W[1]; wy = W[2]; wz = W[3];
 [vy * wz - vz * wy, vz * wx - vx * wz, vx * wy - vy * wx]
}

Projection(V, W) = {
  V * DotProduct(W, V) / Length(V) * Length(V)
}
