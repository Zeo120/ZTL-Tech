#!/usr/bin/env python3
"""
PHASR Satan's Recursion | Video Frame & Animation Generator

This script reads the binary telemetry export from the C++ curved spacetime wave solver
and renders a high-quality visualization video/animation of the geodesic deviation.
"""

import sys
import struct
import numpy as np

def main():
    if len(sys.argv) < 2:
        print("Usage: python render_video.py <path_to_simulation.bin> [output_format: gif|mp4|frames]")
        print("Defaulting to input file: spacetime_simulation.bin")
        bin_path = "spacetime_simulation.bin"
    else:
        bin_path = sys.argv[1]

    output_fmt = sys.argv[2] if len(sys.argv) > 2 else "gif"

    print(f"[*] Reading binary data from {bin_path}...")
    try:
        with open(bin_path, "rb") as f:
            header = f.read(8)
            if len(header) < 8:
                print("[ERROR] Invalid binary file header.")
                sys.exit(1)
            
            grid_size, total_steps = struct.unpack("<II", header)
            print(f"    Grid Size: {grid_size}")
            print(f"    Total Steps: {total_steps}")
            
            # Read all frame data (float array)
            raw_data = f.read()
            expected_bytes = grid_size * total_steps * 4
            if len(raw_data) < expected_bytes:
                print(f"[WARNING] File size is smaller than expected. Found {len(raw_data)} bytes, expected {expected_bytes} bytes.")
                total_steps = len(raw_data) // (grid_size * 4)
                print(f"    Adjusting to read {total_steps} complete frames.")
            
            data = np.frombuffer(raw_data[:grid_size * total_steps * 4], dtype=np.float32)
            frames = data.reshape((total_steps, grid_size))
    except FileNotFoundError:
        print(f"[ERROR] Binary file not found at {bin_path}. Run satan_recursion.exe to generate it.")
        sys.exit(1)

    print("[*] Setting up visualization canvas...")
    try:
        import matplotlib.pyplot as plt
        import matplotlib.animation as animation
    except ImportError:
        print("[ERROR] matplotlib and numpy are required. Please run: pip install matplotlib numpy")
        sys.exit(1)

    fig, ax = plt.subplots(figsize=(10, 6), facecolor="#0d0e15")
    ax.set_facecolor("#0d0e15")
    
    # Configure colors and limits
    ax.set_title("PHASR Satan's Recursion: Geodesic Wave Propagation", color="#e4e6eb", fontsize=14, fontweight="bold", pad=15)
    ax.set_xlim(0, grid_size - 1)
    ax.set_ylim(-1.5, 1.5)
    ax.set_xlabel("Curved Spacetime Spatial Coordinate (x)", color="#a3a7b5")
    ax.set_ylabel("Geodesic Deviation Amplitude (Psi)", color="#a3a7b5")
    ax.tick_params(colors="#a3a7b5")
    ax.grid(True, linestyle="--", alpha=0.1, color="#e4e6eb")

    # Wave line
    line, = ax.plot([], [], color="#00f2fe", lw=2, shadow=True, label="Psi (Geodesic Deviation)")
    # High energy event center shading
    ax.axvspan(grid_size/2 - 4, grid_size/2 + 4, color="#ff007f", alpha=0.1, label="High Energy Celestial Core")
    ax.legend(facecolor="#161925", edgecolor="#30364d", labelcolor="#e4e6eb")

    # Limit render count to 500 frames for display responsiveness if outputting a preview
    render_step = max(1, total_steps // 500)
    indices = list(range(0, total_steps, render_step))

    def init():
        line.set_data([], [])
        return line,

    def animate(i):
        x = np.arange(grid_size)
        y = frames[i]
        line.set_data(x, y)
        ax.set_title(f"PHASR Satan's Recursion: Wave State {i*render_step:06d}/{total_steps}", color="#e4e6eb", fontsize=14, fontweight="bold", pad=15)
        return line,

    ani = animation.FuncAnimation(fig, animate, init_func=init, frames=indices, interval=20, blit=True)

    if output_fmt == "mp4":
        out_name = "spacetime_simulation.mp4"
        print(f"[*] Exporting animation to {out_name}...")
        try:
            writer = animation.FFMpegWriter(fps=30, metadata=dict(artist='PHASR System'), bitrate=1800)
            ani.save(out_name, writer=writer)
            print(f"[SUCCESS] Video animation saved to {out_name}")
        except Exception as e:
            print(f"[ERROR] Failed to save MP4: {e}. Ensure ffmpeg is installed.")
    elif output_fmt == "frames":
        print("[*] Saving individual frames to 'frames/' directory...")
        import os
        os.makedirs("frames", exist_ok=True)
        for idx in indices[:50]: # Save first 50 frame files as examples
            plt.clf()
            plt.plot(frames[idx], color="#00f2fe")
            plt.savefig(f"frames/frame_{idx:06d}.png")
        print("[SUCCESS] Exported first 50 frame images to ./frames/")
    else:
        out_name = "spacetime_simulation.gif"
        print(f"[*] Exporting animation to {out_name}...")
        try:
            ani.save(out_name, writer='pillow', fps=30)
            print(f"[SUCCESS] GIF animation saved to {out_name}")
        except Exception as e:
            print(f"[ERROR] Failed to save GIF: {e}")

if __name__ == "__main__":
    main()
