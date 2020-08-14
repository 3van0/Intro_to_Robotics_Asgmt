function tau = ctorqfun(robot, t, q, qd, qstar, qdstar, qddstar, Kp, Kv)
% Computed torque controller
qdd1 = qddstar + Kv*(qdstar - qd) + Kp*(qstar - q);
tau = robot.rne(q, qd, qdd1);
end