function expr_new = removeSingularities(expr, sing_vars, sing_vals, eps_factor)
    expr_new = vpa(expr);
    for j = 1:numel(expr_new)
        for i = 1:length(sing_vars)
            fprintf("Expression %d: Removing singularity in %s at %.3f\n", j, string(sing_vars(i)), sing_vals(i));
    
            lim_plus = subs(expr_new(j), sing_vars(i), sing_vals(i) + eps*eps_factor);
            lim_minus = subs(expr_new(j), sing_vars(i), sing_vals(i) - eps*eps_factor);
            lim_val = (lim_plus + lim_minus) / 2;
            expr_new(j) = piecewise(sing_vars(i) == sing_vals(i), lim_val, expr_new(j));
        end
    end
    expr_new = vpa(expr_new);
end