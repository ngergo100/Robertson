Solution of Robertson chemical system with stiff and non-stiff solvers and Runge-Kutta 4

The following ODE system due to H. Robertson models a chemical reaction system and has been used as test problem for stiff solvers

![alt text](https://github.com/ngergo100/Robertson/blob/master/Task.png)

where α = 0.04, β = 1e+4, γ = 3e+7 are slow fast and very fast reaction rates. The starting point is (1, 0, 0).

(a) It is known that this system reaches a steady state. Show that   yi(t) = 1 for i=1 all t ≥ 0. Find the steady state.

(b) First use RK4 and a built-in nonstiff numerical ODE solver of your programming language (e.g. ode45 in Matlab) with crude error tolerance on the interval t ∈ [0, 5]. Are the obtained results adequate?

(c) The convergence to the steady state is very slow for this problem. Compare the built-in stiff solvers of your programming language on the interval t ∈ [0, 1e + 6]. Plot the solution on a semilog scale in t.
