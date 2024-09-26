function d_expr_d_t = diffAndSubstitute(expr, order, dictionary)
    n = size(dictionary, 1);

    syms a(t) [n 1]
    dictionary_t(t) = sym(size(dictionary));
    dictionary_t = formula(dictionary_t);
    dictionary_t(1:n, 1) = a;

    for i = 2:size(dictionary, 2)
        dictionary_t(1:n, i) = diff(a, t, i - 1);
    end

    expr_t = subs(expr, dictionary, dictionary_t);
    
    d_expr_d_t_t = diff(expr_t, t, order);

    for i = size(dictionary, 2):(-1):1
        d_expr_d_t = subs(d_expr_d_t_t, dictionary_t(:, i), dictionary(:, i));
        d_expr_d_t_t = d_expr_d_t;
    end
end
