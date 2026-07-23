#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <process.h>

// Division of Purpose: Developer Experience (CLI Wrapper)
// Tech Stack: Pure C
//
// This is the global `phasr` command line tool.
// It wraps the raw Engine.c and provides a production-ready interface
// for developers to initialize the registry, scan codebases, and launch the UI.

void print_help() {
    printf("\n===========================================================\n");
    printf(" PHASR (DEVM) - ABSOLUTE PHYSICS ENGINE CLI\n");
    printf("===========================================================\n");
    printf(" Usage: phasr <command> [options]\n\n");
    printf(" Commands:\n");
    printf("   init                 Initialize a default phasr.yaml in the current directory\n");
    printf("   scan <target_dir>    Execute the DEVM physics pipeline against the target directory\n");
    printf("   version              Display the current DEVM Engine build\n");
    printf("===========================================================\n\n");
}

void init_registry() {
    FILE *file = fopen("phasr.yaml", "r");
    if (file) {
        printf("[!] phasr.yaml already exists in this directory.\n");
        fclose(file);
        return;
    }
    
    file = fopen("phasr.yaml", "w");
    if (!file) {
        printf("FATAL: Failed to create phasr.yaml. Check permissions.\n");
        return;
    }
    
    fprintf(file, "# PHASR (DEVM) Dynamic Module Registry\n");
    fprintf(file, "modules:\n");
    fprintf(file, "  - path: \"./Module1_Aggregator\"\n");
    fprintf(file, "  - path: \"./Module2_DataAnalyser\"\n");
    fprintf(file, "  - path: \"./Module3_AnomalyAnalyser\"\n");
    fprintf(file, "  - path: \"./Module4_SecurityMath\"\n");
    fprintf(file, "  - path: \"./Module5_TemporalPhysics\"\n");
    fclose(file);
    
    printf("[✓] Initialized phasr.yaml registry successfully.\n");
}

void execute_engine(const char *target_dir) {
    // FIX: Using _spawnlp instead of system() avoids shell interpretation
    // and completely prevents Command Injection side-channels.
    intptr_t status = _spawnlp(_P_WAIT, "node", "node", "PHASR(DEVM)/CLI/analyzer.js", target_dir, NULL);
    
    if (status == -1) {
        printf("[FATAL] Failed to boot Node.js physics module.\n");
    }
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        print_help();
        return 1;
    }

    if (strcmp(argv[1], "help") == 0) {
        print_help();
    } 
    else if (strcmp(argv[1], "init") == 0) {
        init_registry();
    } 
    else if (strcmp(argv[1], "scan") == 0) {
        if (argc < 3) {
            printf("Error: Missing target directory.\nUsage: phasr scan <target_dir>\n");
            return 1;
        }
        execute_engine(argv[2]);
    } 
    else if (strcmp(argv[1], "version") == 0) {
        printf("PHASR (DEVM) v1.0.0-baremetal\n");
    } 
    else {
        printf("Error: Unknown command '%s'\n", argv[1]);
        print_help();
        return 1;
    }

    return 0;
}
