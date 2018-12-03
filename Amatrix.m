function Amatrix = Amatrix(r,d,a,t)
% r = link length
% d = offser
% a = alpha angles
% t = theta angles

Rot_zt = [cos(t) -1*sin(t) 0 0;...
    sin(t) cos(t) 0 0;...
    0 0 1 0;...
    0 0 0 1];

Trans_zd = [1 0 0 0;...
            0 1 0 0;...
            0 0 1 d;...
            0 0 0 1];

Trans_xa = [1 0 0 r;...
            0 1 0 0;...
            0 0 1 0;...
            0 0 0 1];

Rot_za = [1 0 0 0;...
          0 cos(a) -1*sin(a) 0;...
          0 sin(a) cos(a) 0;...
          0 0 0 1];

Amatrix = Rot_zt*Trans_zd*Trans_xa*Rot_za;
end