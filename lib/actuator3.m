function l_3 = actuator3(in1,in2)
%ACTUATOR3
%    L_3 = ACTUATOR3(IN1,IN2)

%    This function was generated by the Symbolic Math Toolbox version 24.1.
%    17-Sep-2024 20:30:48

beta = in1(1,:);
gamma = in1(2,:);
l_attach = in2(3,:);
r_attach = in2(4,:);
x_dist = in2(1,:);
y_dist = in2(2,:);
zeta_stand = in2(5,:);
t2 = cos(beta);
t3 = cos(gamma);
t4 = sin(beta);
t5 = sin(gamma);
t6 = cos(zeta_stand);
t7 = sin(zeta_stand);
l_3 = [l_attach.*(t5.*t7-t2.*t3.*t6)-r_attach.*(t5.*t6+t2.*t3.*t7)+t7.*x_dist-t6.*y_dist;-l_attach.*(t3.*t7+t2.*t5.*t6)+r_attach.*(t3.*t6-t2.*t5.*t7)-t6.*x_dist-t7.*y_dist;l_attach.*t4.*t6+r_attach.*t4.*t7];
end
