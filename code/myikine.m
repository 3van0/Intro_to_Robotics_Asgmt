function Q = myikine(T)
l1 = 0.35;
d2 = 0.4605;
l2 = 0.25;
d3_offset = 0.0855;
c_phi = T(1, 1);
s_phi = T(1, 2);
x = T(1, 4);
y = T(2, 4);
z = T(3, 4);

% solve for theta2
c2 = (x^2 + y^2 - l1^2 - l2^2)/(2*l1*l2);
s2 = [sqrt(1-c2^2), -sqrt(1-c2^2)];
theta2 = atan2(s2, c2);

% solve for theta1
k1 = l1 +l2*c2;
k2 = l2.*s2;
theta1 = atan2(y, x) - atan2(k2, k1);

% solve for theta4
theta4 = theta1 +theta2 - atan2(s_phi, c_phi);
s = sign(theta4);
spi = s*pi;
theta4 = mod(theta4,spi); % theta within (-pi, pi)

% solve for d3
d3 = d2 - z - d3_offset;

Q = [theta1(1), theta2(1), d3, theta4(1); theta1(2), theta2(2), d3, theta4(2)];
end