#include <stdint.h>
#include <cmath>
#include <vector>

extern "C" {
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
