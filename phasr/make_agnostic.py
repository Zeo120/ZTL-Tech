import os
import glob

def make_agnostic():
    base_dir = r"D:\Project XT\phasr"
    extensions = ["*.c", "*.cpp"]
    
    replacements = [
        ("#if defined(_WIN32)", "#if 1 // PLATFORM_AGNOSTIC_C_FALLBACK_FORCED"),
        ("#ifdef FSM_C_FALLBACK", "#if 1 // PLATFORM_AGNOSTIC_C_FALLBACK_FORCED"),
        ("#if !defined(__aarch64__) && !(defined(__linux__) && defined(__x86_64__))", "#if 1 // PLATFORM_AGNOSTIC_C_FALLBACK_FORCED"),
    ]
    
    count = 0
    for ext in extensions:
        for root, dirs, files in os.walk(base_dir):
            for file in files:
                if file.endswith(ext[1:]) or file.endswith(ext[2:]):
                    file_path = os.path.join(root, file)
                    with open(file_path, "r", encoding="utf-8") as f:
                        content = f.read()
                    
                    modified = content
                    for old, new in replacements:
                        modified = modified.replace(old, new)
                    
                    if modified != content:
                        with open(file_path, "w", encoding="utf-8") as f:
                            f.write(modified)
                        count += 1
                        print(f"Updated {file_path}")
    print(f"Total files updated: {count}")

if __name__ == "__main__":
    make_agnostic()
