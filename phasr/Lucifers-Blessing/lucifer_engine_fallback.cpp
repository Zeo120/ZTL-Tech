#include <stdint.h>
#include <cmath>

struct game_params_t {
    double D_total;
    double G_e;
    double R_a;
    double C_c;
    double P_m;
};

struct replica_params_t {
    double D_r;
    double C_challenge;
    double R_promo;
};

struct damping_params_t {
    double D_r;
    double gamma_0;
    double gamma_transient;
};

struct fdtd_params_t {
    float* phi;
    float* phi_prev;
    float* phi_next;
    double gamma_r;
    double dt;
    double r2;
    int grid_size;
};

extern "C" {
    int evaluate_critical_threshold(const game_params_t* params) {
        double num = params->G_e - params->R_a + params->C_c;
        double denom = params->G_e + params->P_m;
        double D_critical = num / denom;
        return params->D_total >= D_critical;
    }

    int evaluate_replica_challenge(const replica_params_t* params) {
        double limit = 1.0 - (params->C_challenge / params->R_promo);
        return params->D_r < limit;
    }

    double modulate_damping(const damping_params_t* params) {
        return params->gamma_0 * params->D_r + params->gamma_transient * (1.0 - params->D_r);
    }

    void fdtd_wave_step(const fdtd_params_t* params) {
        double half_gamma_dt = params->gamma_r * params->dt / 2.0;
        double denom = 1.0 + half_gamma_dt;
        double prev_coeff = 1.0 - half_gamma_dt;
        double r2 = params->r2;
        int size = params->grid_size;

        for (int i = 1; i < size - 1; i++) {
            double laplacian = params->phi[i+1] - 2.0 * params->phi[i] + params->phi[i-1];
            double next_val = (2.0 * params->phi[i] - params->phi_prev[i] * prev_coeff + r2 * laplacian) / denom;
            params->phi_next[i] = (float)next_val;
        }
    }
}
