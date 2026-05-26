#include <iostream>
#include <iomanip>
#include <vector>
#include <string>
#include <cmath>
#include <random>
#include <cassert>
#include <algorithm>
#include <cstring>

// ============================================================
// Primordial Sin — Fully Unrolled Boot Attestation Driver
// Links against primordial_engine.asm (213K+ LoC, pure x86-64)
// ============================================================

#ifdef NO_ASM
namespace fallback {
    double calculate_shannon_entropy(const uint32_t* histogram, uint64_t total_count);
    double evaluate_bayesian_trust(const double* likelihoods_trust,
                                   const double* likelihoods_compromised,
                                   int n, double prior_trust);
    void initialize_wave_field(float* phi, int grid_size, double d_initial,
                               double amplitude, double sigma, double center);
    int validate_boot_memory(const uint8_t* boot_data, const uint8_t* baseline_data,
                             uint64_t* hash_accum, uint32_t* histogram);
}

extern "C" {
    int validate_boot_memory(const uint8_t* boot_data, const uint8_t* baseline_data,
                             uint64_t* hash_accum, uint32_t* histogram) {
        return fallback::validate_boot_memory(boot_data, baseline_data, hash_accum, histogram);
    }

    double calculate_shannon_entropy(const uint32_t* histogram, uint64_t total_count) {
        return fallback::calculate_shannon_entropy(histogram, total_count);
    }

    double evaluate_bayesian_trust(const double* likelihoods_trust,
                                   const double* likelihoods_compromised,
                                   int n, double prior_trust) {
        return fallback::evaluate_bayesian_trust(likelihoods_trust, likelihoods_compromised, n, prior_trust);
    }

    void initialize_wave_field(float* phi, int grid_size, double d_initial,
                               double amplitude, double sigma, double center) {
        fallback::initialize_wave_field(phi, grid_size, d_initial, amplitude, sigma, center);
    }
}
#else
extern "C" {
    // Validates boot memory against baseline (4,096 unrolled byte scanners)
    // Fills histogram and hash accumulator as side effects
    int validate_boot_memory(const uint8_t* boot_data, const uint8_t* baseline_data,
                             uint64_t* hash_accum, uint32_t* histogram);

    // Computes Shannon entropy from pre-filled histogram (256 unrolled bins)
    double calculate_shannon_entropy(const uint32_t* histogram, uint64_t total_count);

    // Bayesian trust update (compact loop)
    double evaluate_bayesian_trust(const double* likelihoods_trust,
                                   const double* likelihoods_compromised,
                                   int n, double prior_trust);

    // Seeds wave field with Gaussian pulse (200 unrolled cell seeders)
    void initialize_wave_field(float* phi, int grid_size, double d_initial,
                               double amplitude, double sigma, double center);
}
#endif

// C++ reference implementations for differential testing
namespace fallback {
    double calculate_shannon_entropy(const uint32_t* histogram, uint64_t total_count) {
        if (total_count == 0) return 0.0;
        double entropy = 0.0;
        double inv_size = 1.0 / (double)total_count;
        for (int i = 0; i < 256; i++) {
            if (histogram[i] > 0) {
                double p = (double)histogram[i] * inv_size;
                entropy -= p * std::log2(p);
            }
        }
        return entropy;
    }

    double calculate_shannon_entropy_from_data(const uint8_t* boot_data, uint64_t size) {
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

    double evaluate_bayesian_trust(const double* likelihoods_trust,
                                   const double* likelihoods_compromised,
                                   int n, double prior_trust) {
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

    void initialize_wave_field(float* phi, int grid_size, double d_initial,
                               double amplitude, double sigma, double center) {
        double factor = amplitude * (1.0 - d_initial);
        double denom = 2.0 * sigma * sigma;
        for (int i = 0; i < grid_size; i++) {
            double diff = (double)i - center;
            double exponent = -(diff * diff) / denom;
            phi[i] = (float)(factor * std::exp(exponent));
        }
    }

    int validate_boot_memory(const uint8_t* boot_data, const uint8_t* baseline_data,
                             uint64_t* hash_accum, uint32_t* histogram) {
        int matches = 0;
        *hash_accum = 0;
        memset(histogram, 0, 256 * sizeof(uint32_t));
        for (int i = 0; i < 4096; i++) {
            uint8_t actual = boot_data[i];
            uint8_t expected = baseline_data[i];
            histogram[actual]++;
            uint64_t h = *hash_accum;
            h ^= actual;
            int rot = (i % 13) + 1;
            h = (h << rot) | (h >> (64 - rot));
            h += 0x9E3779B9ULL;
            *hash_accum = h;
            if (actual == expected) matches++;
        }
        return matches;
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
    std::cout << "Engine: 213K+ LoC Fully-Unrolled x86-64 Assembly\n";
    std::cout << "==================================================\n\n";

    std::mt19937 rng(42);
    std::uniform_real_distribution<double> dist_prob(0.01, 0.99);
    std::uniform_int_distribution<int> dist_byte(0, 255);

    // ================================================================
    // [1/4] Boot Memory Attestation (validate_boot_memory)
    // ================================================================
    std::cout << "[1/4] Testing boot memory attestation (4,096 unrolled byte scanners)...\n";
    {
        // Create identical boot_data and baseline — all 4096 should match
        std::vector<uint8_t> boot_data(4096);
        std::vector<uint8_t> baseline(4096);
        for (int i = 0; i < 4096; i++) {
            boot_data[i] = (uint8_t)dist_byte(rng);
            baseline[i] = boot_data[i]; // identical
        }

        uint64_t hash_asm = 0, hash_fb = 0;
        uint32_t hist_asm[256] = {0}, hist_fb[256] = {0};

        int matches_asm = validate_boot_memory(boot_data.data(), baseline.data(), &hash_asm, hist_asm);
        int matches_fb = fallback::validate_boot_memory(boot_data.data(), baseline.data(), &hash_fb, hist_fb);

        if (matches_asm != 4096 || matches_asm != matches_fb) {
            std::cerr << "FAIL: validate_boot_memory ASM=" << matches_asm << " FB=" << matches_fb << " (expected 4096)\n";
            return 1;
        }
        std::cout << "      PASS: Clean boot — " << matches_asm << "/4096 bytes match (cross-validated vs C++ fallback).\n";

        // Now corrupt 10 bytes
        for (int i = 0; i < 10; i++) {
            boot_data[i * 400] ^= 0xFF;
        }
        hash_asm = 0;
        memset(hist_asm, 0, sizeof(hist_asm));
        matches_asm = validate_boot_memory(boot_data.data(), baseline.data(), &hash_asm, hist_asm);
        std::cout << "      PASS: Corrupted boot — " << matches_asm << "/4096 bytes match (10 tampered).\n";
        if (matches_asm != 4086) {
            std::cerr << "FAIL: Expected 4086 matches, got " << matches_asm << "\n";
            return 1;
        }
    }
    std::cout << "\n";

    // ================================================================
    // [2/4] Shannon Entropy via Unrolled Bins
    // ================================================================
    std::cout << "[2/4] Testing Shannon entropy (256 unrolled entropy bins)...\n";
    {
        int entropy_passes = 0;
        for (int t = 0; t < 500; t++) {
            int buf_size = 4096; // Must be exactly 4096 for unrolled scanner
            std::vector<uint8_t> test_buf(buf_size);
            std::vector<uint8_t> baseline(buf_size);
            for (int i = 0; i < buf_size; i++) {
                test_buf[i] = (uint8_t)dist_byte(rng);
                baseline[i] = test_buf[i]; // identical baseline
            }

            // Use validate_boot_memory to fill histogram
            uint64_t hash = 0;
            uint32_t histogram[256] = {0};
            validate_boot_memory(test_buf.data(), baseline.data(), &hash, histogram);

            // Compute entropy from histogram
            double ent_asm = calculate_shannon_entropy(histogram, (uint64_t)buf_size);
            double ent_fb = fallback::calculate_shannon_entropy_from_data(test_buf.data(), (uint64_t)buf_size);

            if (std::abs(ent_asm - ent_fb) > 1e-6) {
                std::cerr << "Shannon entropy mismatch at test " << t << "\n";
                std::cerr << "ASM: " << ent_asm << ", Fallback: " << ent_fb << "\n";
                return 1;
            }
            entropy_passes++;
        }
        std::cout << "      SUCCESS: " << entropy_passes << " entropy tests passed.\n\n";
    }

    // ================================================================
    // [3/4] Bayesian Trust Update
    // ================================================================
    std::cout << "[3/4] Testing Bayesian trust (500 differential checks)...\n";
    {
        int bayes_passes = 0;
        for (int t = 0; t < 500; t++) {
            int checks = 5 + (t % 10);
            std::vector<double> likelihoods_trust(checks);
            std::vector<double> likelihoods_compromised(checks);
            for (int i = 0; i < checks; i++) {
                likelihoods_trust[i] = dist_prob(rng);
                likelihoods_compromised[i] = dist_prob(rng);
            }
            double prior = dist_prob(rng);

            double trust_asm = evaluate_bayesian_trust(
                likelihoods_trust.data(), likelihoods_compromised.data(), checks, prior);
            double trust_fb = fallback::evaluate_bayesian_trust(
                likelihoods_trust.data(), likelihoods_compromised.data(), checks, prior);

            if (std::abs(trust_asm - trust_fb) > 1e-9) {
                std::cerr << "Bayesian trust mismatch at test " << t << "\n";
                std::cerr << "ASM: " << trust_asm << ", Fallback: " << trust_fb << "\n";
                return 1;
            }
            bayes_passes++;
        }
        std::cout << "      SUCCESS: " << bayes_passes << " Bayesian trust tests passed.\n\n";
    }

    // ================================================================
    // [4/4] Wave Field Seeding Visualization
    // ================================================================
    std::cout << "[4/4] Visualizing Wave Field Seeding (200 unrolled cell seeders)...\n";
    {
        // Differential test first
        int wave_passes = 0;
        for (int t = 0; t < 200; t++) {
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
                    std::cerr << "Wave mismatch at cell " << i << " (test " << t << ")\n";
                    std::cerr << "ASM: " << wave_asm[i] << ", Fallback: " << wave_fb[i] << "\n";
                    return 1;
                }
            }
            wave_passes++;
        }
        std::cout << "      SUCCESS: " << wave_passes << " wave field tests passed.\n";

        // Visual display
        const int grid_size = 40;
        std::vector<float> phi(grid_size, 0.0f);

        std::cout << "\n  --- CASE A: Clean Boot (D_Initial=1.0, Flat Field) ---\n";
        std::fill(phi.begin(), phi.end(), 0.0f);
        initialize_wave_field(phi.data(), grid_size, 1.0, 1.25, 3.5, 20.0);
        print_wave(phi.data(), grid_size);

        std::cout << "\n  --- CASE B: Compromised Boot (D_Initial=0.0, Gaussian Pulse) ---\n";
        std::fill(phi.begin(), phi.end(), 0.0f);
        initialize_wave_field(phi.data(), grid_size, 0.0, 1.25, 3.5, 20.0);
        print_wave(phi.data(), grid_size);
    }

    std::cout << "\n==================================================\n";
    std::cout << "All Primordial Sin attestation tests PASSED.\n";
    std::cout << "==================================================\n";
    return 0;
}
