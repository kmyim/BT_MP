results = zeros(100, 100);
q0 = 0.01;

for nr =1:100
    r = (nr-1)/200;
    for nz = 1:100
        z = 10*(nz-1)/100;
        qinfty = g_iterate(q0, z, r);
        results(nr, nz) = rho(qinfty, r, z);
    end
end