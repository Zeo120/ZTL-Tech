#include <iostream>
#include <iomanip>
#include <vector>
#include <string>
#include <cmath>
#include <random>
#include <cassert>
#include <algorithm>

extern "C" {
    double calculate_shannon_entropy(const uint8_t* boot_data, uint64_t size);
    double evaluate_bayesian_trust(const double* likelihoods_trust, const double* likelihoods_compromised, int n, double prior_trust);
    void initialize_wave_field(float* phi, int grid_size, double d_initial, double amplitude, double sigma, double center);
}

namespace fallback {
    double calculate_shannon_entropy(const uint8_t* boot_data, uint64_t size) {
        if (size == 0) return 0.0;
        uint64_t counts[256] = {0};
        for (uint64_t i = 0; i < size; i++) {
            counts[boot_data[i]]++;
        }
        double entropy = 0.0;
        double inv_size = 1.0 / (double)size;
        for (int i = 0; i < 256; i++) {
            if (counts[i] > 0) {
                double p = (double)counts[i] * inv_size;
                entropy -= p * std::log2(p);
            }
        }
        return entropy;
    }

    double evaluate_bayesian_trust(const double* likelihoods_trust, const double* likelihoods_compromised, int n, double prior_trust) {
        double num = prior_trust;
        double comp = 1.0 - prior_trust;
        for (int i = 0; i < n; i++) {
            num *= likelihoods_trust[i];
            comp *= likelihoods_compromised[i];
        }
        double denom = num + comp;
        if (denom == 0.0) return 0.0;
        return num / denom;
    }

    void initialize_wave_field(float* phi, int grid_size, double d_initial, double amplitude, double sigma, double center) {
        double factor = amplitude * (1.0 - d_initial);
        double denom = 2.0 * sigma * sigma;
        for (int i = 0; i < grid_size; i++) {
            double diff = (double)i - center;
            double exponent = -(diff * diff) / denom;
            phi[i] = (float)(factor * std::exp(exponent));
        }
    }
}

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
        if (val > 1.5f) val = 1.5f;
        if (val < -1.5f) val = -1.5f;
        int y = mid_y - (int)std::round((val / 1.5f) * (float)mid_y);
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
    std::cout << "PHASR Initial Attestation: Primordial Sin Suite\n";
    std::cout << "Target Engine: x86-64 / ARM64 Assembly Attestation\n";
    std::cout << "==================================================\n\n";

    // 1. Run 1,000 Differential Validation Checks
    std::cout << "[1/3] Running 1,000 differential cross-validation checks...\n";
    std::mt19937 rng(42);
    std::uniform_real_distribution<double> dist_prob(0.01, 0.99);
    std::uniform_int_distribution<int> dist_byte(0, 255);

    int test_passes = 0;
    for (int t = 0; t < 1000; t++) {
        // Shannon Entropy Check
        int buf_size = 100 + (t % 500);
        std::vector<uint8_t> test_buf(buf_size);
        for (int i = 0; i < buf_size; i++) {
            test_buf[i] = (uint8_t)dist_byte(rng);
        }

        double ent_asm = calculate_shannon_entropy(test_buf.data(), buf_size);
        double ent_fb = fallback::calculate_shannon_entropy(test_buf.data(), buf_size);
        if (std::abs(ent_asm - ent_fb) > 1e-9) {
            std::cerr << "Mismatch in calculate_shannon_entropy at test " << t << "\n";
            std::cerr << "ASM: " << ent_asm << ", Fallback: " << ent_fb << "\n";
            return 1;
        }

        // Bayesian Trust Check
        int checks = 5 + (t % 10);
        std::vector<double> likelihoods_trust(checks);
        std::vector<double> likelihoods_compromised(checks);
        for (int i = 0; i < checks; i++) {
            likelihoods_trust[i] = dist_prob(rng);
            likelihoods_compromised[i] = dist_prob(rng);
        }
        double prior = dist_prob(rng);

        double trust_asm = evaluate_bayesian_trust(likelihoods_trust.data(), likelihoods_compromised.data(), checks, prior);
        double trust_fb = fallback::evaluate_bayesian_trust(likelihoods_trust.data(), likelihoods_compromised.data(), checks, prior);
        if (std::abs(trust_asm - trust_fb) > 1e-9) {
            std::cerr << "Mismatch in evaluate_bayesian_trust at test " << t << "\n";
            std::cerr << "ASM: " << trust_asm << ", Fallback: " << trust_fb << "\n";
            return 1;
        }

        // Initial Wave Field Seeding Check
        const int grid_size = 40;
        std::vector<float> wave_asm(grid_size, 0.0f);
        std::vector<float> wave_fb(grid_size, 0.0f);

        double d_init = dist_prob(rng) > 0.5 ? 1.0 : 0.0;
        double amplitude = 1.25;
        double sigma = 3.5;
        double center = 20.0;

        initialize_wave_field(wave_asm.data(), grid_size, d_init, amplitude, sigma, center);
        fallback::initialize_wave_field(wave_fb.data(), grid_size, d_init, amplitude, sigma, center);

        for (int i = 0; i < grid_size; i++) {
            if (std::abs(wave_asm[i] - wave_fb[i]) > 1e-5f) {
                std::cerr << "Mismatch in initialize_wave_field at cell " << i << " (test " << t << ")\n";
                std::cerr << "ASM: " << wave_asm[i] << ", Fallback: " << wave_fb[i] << "\n";
                return 1;
            }
        }

        test_passes++;
    }
    std::cout << "      SUCCESS: 1,000 tests passed (Assembly output matches C++ fallback exactly).\n\n";

    // 2. Run Wave Field Seeding Visual Simulation
    std::cout << "[2/3] Visualizing Seeding of Initial Wave Field...\n";
    const int grid_size = 40;
    std::vector<float> phi(grid_size, 0.0f);

    // CASE A: Clean Boot (D_Initial = 1.0)
    std::cout << "\n  --- CASE A: Clean Boot Attestation (D_Initial = 1.0, Flat Initial Field) ---\n";
    std::fill(phi.begin(), phi.end(), 0.0f);
    initialize_wave_field(phi.data(), grid_size, 1.0, 1.25, 3.5, 20.0);
    print_wave(phi.data(), grid_size);

    // CASE B: Compromised Boot (D_Initial = 0.0)
    std::cout << "\n  --- CASE B: Compromised Boot Attestation (D_Initial = 0.0, Gaussian Pulse Seed) ---\n";
    std::fill(phi.begin(), phi.end(), 0.0f);
    initialize_wave_field(phi.data(), grid_size, 0.0, 1.25, 3.5, 20.0);
    print_wave(phi.data(), grid_size);

    std::cout << "\nInitial wave field seeding verification complete.\n";
    std::cout << "==================================================\n";
    return 0;
}
