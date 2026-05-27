#include <iostream>
#include <iomanip>
#include <vector>
#include <string>
#include <cmath>
#include <random>
#include <cassert>
#include <algorithm>

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
    int evaluate_critical_threshold(const game_params_t* params);
    int evaluate_replica_challenge(const replica_params_t* params);
    double modulate_damping(const damping_params_t* params);
    void fdtd_wave_step(const fdtd_params_t* params);
}

// Fallback namespace for verification
namespace fallback {
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

#ifdef NO_ASM
extern "C" {
    int evaluate_critical_threshold(const game_params_t* params) {
        return fallback::evaluate_critical_threshold(params);
    }
    int evaluate_replica_challenge(const replica_params_t* params) {
        return fallback::evaluate_replica_challenge(params);
    }
    double modulate_damping(const damping_params_t* params) {
        return fallback::modulate_damping(params);
    }
    void fdtd_wave_step(const fdtd_params_t* params) {
        fallback::fdtd_wave_step(params);
    }
}
#endif

void print_wave(const float* phi, int size) {
    const int height = 9;
    const int mid_y = height / 2;
    std::vector<std::string> display(height, std::string(size, ' '));
    for (int i = 0; i < height; i++) {
        if (i == mid_y) {
            for (int j = 0; j < size; j++) display[i][j] = '-';
        }
    }
    for (int i = 0; i < size; i++) {
        float val = phi[i];
        if (val > 1.0f) val = 1.0f;
        if (val < -1.0f) val = -1.0f;
        int y = mid_y - (int)std::round(val * (float)mid_y);
        if (y < 0) y = 0;
        if (y >= height) y = height - 1;
        display[y][i] = (y == mid_y) ? 'o' : '*';
    }
    std::cout << "  +";
    for (int j = 0; j < size; j++) std::cout << "-";
    std::cout << "+\n";
    for (int i = 0; i < height; i++) {
        std::cout << "  |" << display[i] << "|\n";
    }
    std::cout << "  +";
    for (int j = 0; j < size; j++) std::cout << "-";
    std::cout << "+\n";
}

int main() {
    std::cout << "==================================================\n";
    std::cout << "PHASR Game Theory: Lucifer's Blessing Audit Suite\n";
    std::cout << "Target Engine: x86-64 / ARM64 Assembly Attestation\n";
    std::cout << "==================================================\n\n";

    // 1. Run 1,000 Differential Validation Checks
    std::cout << "[1/3] Running 1,000 differential cross-validation checks...\n";
    std::mt19937 rng(42);
    std::uniform_real_distribution<double> dist_prob(0.0, 1.0);
    std::uniform_real_distribution<double> dist_val(1.0, 100.0);

    int test_passes = 0;
    for (int t = 0; t < 1000; t++) {
        // Critical threshold check
        game_params_t gp;
        gp.D_total = dist_prob(rng);
        gp.G_e = dist_val(rng);
        gp.R_a = dist_val(rng);
        gp.C_c = dist_val(rng);
        gp.P_m = dist_val(rng);

        int res_asm = evaluate_critical_threshold(&gp);
        int res_fb = fallback::evaluate_critical_threshold(&gp);
        if (res_asm != res_fb) {
            std::cerr << "Mismatch in evaluate_critical_threshold at test " << t << "\n";
            std::cerr << "D_total: " << gp.D_total << ", G_e: " << gp.G_e << ", R_a: " << gp.R_a << "\n";
            std::cerr << "C_c: " << gp.C_c << ", P_m: " << gp.P_m << "\n";
            std::cerr << "ASM: " << res_asm << ", Fallback: " << res_fb << "\n";
            return 1;
        }

        // Replica challenge check
        replica_params_t rp;
        rp.D_r = dist_prob(rng);
        rp.C_challenge = dist_val(rng);
        rp.R_promo = gp.G_e + gp.P_m;
        if (rp.R_promo < rp.C_challenge) std::swap(rp.R_promo, rp.C_challenge);

        int rep_asm = evaluate_replica_challenge(&rp);
        int rep_fb = fallback::evaluate_replica_challenge(&rp);
        if (rep_asm != rep_fb) {
            std::cerr << "Mismatch in evaluate_replica_challenge at test " << t << "\n";
            return 1;
        }

        // Damping modulation check
        damping_params_t dp;
        dp.D_r = dist_prob(rng);
        dp.gamma_0 = 0.4;
        dp.gamma_transient = 0.02;

        double damp_asm = modulate_damping(&dp);
        double damp_fb = fallback::modulate_damping(&dp);
        if (std::abs(damp_asm - damp_fb) > 1e-9) {
            std::cerr << "Mismatch in modulate_damping at test " << t << "\n";
            return 1;
        }

        test_passes++;
    }
    std::cout << "      SUCCESS: 1,000 tests passed (Assembly output matches C++ fallback exactly).\n\n";

    // 2. Run FDTD step differential checks
    std::cout << "[2/3] Verifying FDTD wave update step...\n";
    const int grid_size = 40;
    std::vector<float> phi_asm(grid_size, 0.0f);
    std::vector<float> phi_prev_asm(grid_size, 0.0f);
    std::vector<float> phi_next_asm(grid_size, 0.0f);

    std::vector<float> phi_fb(grid_size, 0.0f);
    std::vector<float> phi_prev_fb(grid_size, 0.0f);
    std::vector<float> phi_next_fb(grid_size, 0.0f);

    for (int i = 0; i < grid_size; i++) {
        phi_asm[i] = phi_fb[i] = std::sin(3.14159f * i / grid_size);
    }

    fdtd_params_t fp_asm = { phi_asm.data(), phi_prev_asm.data(), phi_next_asm.data(), 0.1, 0.1, 0.25, grid_size };
    fdtd_params_t fp_fb = { phi_fb.data(), phi_prev_fb.data(), phi_next_fb.data(), 0.1, 0.1, 0.25, grid_size };

    fdtd_wave_step(&fp_asm);
    fallback::fdtd_wave_step(&fp_fb);

    for (int i = 0; i < grid_size; i++) {
        if (std::abs(phi_next_asm[i] - phi_next_fb[i]) > 1e-5f) {
            std::cerr << "Mismatch in FDTD wave update step at cell " << i << "\n";
            std::cerr << "ASM: " << phi_next_asm[i] << ", Fallback: " << phi_next_fb[i] << "\n";
            return 1;
        }
    }
    std::cout << "      SUCCESS: FDTD wave step values match within machine epsilon.\n\n";

    // 3. Run full physical wave propagation under two game states
    std::cout << "[3/3] Simulating Consensus Attestation Wave Dynamics...\n";
    
    // CASE A: Healthy Attestation (D_r = 1.0 -> High Damping)
    std::cout << "\n  --- CASE A: Healthy Consensus State (D_r = 1.0, High Attestation Damping) ---\n";
    std::vector<float> phi(grid_size, 0.0f);
    std::vector<float> phi_prev(grid_size, 0.0f);
    std::vector<float> phi_next(grid_size, 0.0f);

    damping_params_t dp_healthy = { 1.0, 0.4, 0.02 };
    double gamma_healthy = modulate_damping(&dp_healthy);

    for (int step = 0; step < 20; step++) {
        phi[0] = 1.5f * std::sin(0.8f * step);
        fdtd_params_t fp = { phi.data(), phi_prev.data(), phi_next.data(), gamma_healthy, 0.1, 0.25, grid_size };
        fdtd_wave_step(&fp);
        phi_next[grid_size - 1] = 0.0f; // Dirichlet sink

        if (step % 5 == 0) {
            std::cout << "  Step " << step << " (Damped Amplitude): [phi0=" << phi[0] << ", phi1=" << phi[1] << ", phi2=" << phi[2] << "]\n";
            print_wave(phi.data(), grid_size);
        }

        std::swap(phi_prev, phi);
        std::swap(phi, phi_next);
    }

    // CASE B: Collapsed Consensus State (D_r = 0.0 -> Low Damping)
    std::cout << "\n  --- CASE B: Collapsed Consensus / Election State (D_r = 0.0, Low Attestation Damping) ---\n";
    std::fill(phi.begin(), phi.end(), 0.0f);
    std::fill(phi_prev.begin(), phi_prev.end(), 0.0f);
    std::fill(phi_next.begin(), phi_next.end(), 0.0f);

    damping_params_t dp_collapsed = { 0.0, 0.4, 0.02 };
    double gamma_collapsed = modulate_damping(&dp_collapsed);

    for (int step = 0; step < 20; step++) {
        phi[0] = 1.5f * std::sin(0.8f * step);
        fdtd_params_t fp = { phi.data(), phi_prev.data(), phi_next.data(), gamma_collapsed, 0.1, 0.25, grid_size };
        fdtd_wave_step(&fp);
        phi_next[grid_size - 1] = 0.0f; // Dirichlet sink

        std::swap(phi_prev, phi);
        std::swap(phi, phi_next);

        if (step % 5 == 0) {
            std::cout << "  Step " << step << " (Amplified Election Wave):\n";
            print_wave(phi.data(), grid_size);
        }
    }

    std::cout << "Consensus wave propagation sequence complete.\n";
    std::cout << "==================================================\n";
    return 0;
}
