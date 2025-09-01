# Gas-Dynamics-Calculators

MATLAB codes for normal shock, oblique shock, and Prandtl-Meyer expansion calculations.
Isentropic_Flows.m  
    Calculates isentropic flow properties for a given Mach number.  
    Outputs:  
        - Pressure ratio (p/p0, p/p*)  
        - Temperature ratio (T/T0, T/T*)  
        - Density ratio (rho/rho0, rho/rho*)  
        - Area ratio (A/A*)  
        - Mach angle (μ)  
        - Prandtl–Meyer angle (ν)  

Normal_Shock_Calculator.m  
    Solves normal shock wave relations.  
    Inputs: M1, γ  
    Outputs:  
        - Downstream Mach number (M2)  
        - Pressure, density, and temperature ratios  
        - Total pressure ratio (p02/p01)  

Obliques_Shock_Calculator.m  
    Solves oblique shock wave relations using the θ–β–M method.  
    Inputs: M1, γ, deflection angle θ  
    Outputs:  
        - Shock wave angle (β)  
        - M2, M1n, M2n  
        - Pressure, density, and temperature ratios  
        - Total pressure ratio (p02/p01)  

PrandtlMeyerExpansion.m  
    Calculates expansion through a Prandtl–Meyer fan.  
    Inputs: M1, γ, expansion angle θ  
    Outputs:  
        - Downstream Mach number (M2)  
        - Pressure, density, and temperature ratios  
        - Constant total pressure ratio (p02/p01 = 1)  
        - P–M angles (ν(M1), ν(M2))  

        📘 References

Anderson, J.D. Modern Compressible Flow

Shapiro, A.H. The Dynamics and Thermodynamics of Compressible Fluid Flow

IIT/GATE Aerospace Compressible Flow syllabus

✨ Author

Developed by Dipendra Kumar Dewangan
Department of Aerospace Engineering, IIT Kanpur
