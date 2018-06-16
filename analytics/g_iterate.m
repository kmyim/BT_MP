function [qnew] = g_iterate(q0, z, r)
q = q0;
for iter = 1:500
    qnew = g_gauss_ER(q, z, r);
    if qnew < q+0.0001
        break
    else
        q = qnew;
    end
end

