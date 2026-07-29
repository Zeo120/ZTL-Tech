using System;
using System.IO;
using System.Runtime.InteropServices;

// C# Native Bypass Orchestrator (Zero-Dependency)
// This module exists so that PHASR can execute on ANY Windows machine,
// even if Node.js, Python, or MinGW are not installed. 
// It is designed to be compiled using the built-in csc.exe compiler hidden in the Windows directory.

namespace PhasR
{
    class Engine
    {
        [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Auto)]
        public struct WIN32_FIND_DATA
        {
            public uint dwFileAttributes;
            public System.Runtime.InteropServices.ComTypes.FILETIME ftCreationTime;
            public System.Runtime.InteropServices.ComTypes.FILETIME ftLastAccessTime;
            public System.Runtime.InteropServices.ComTypes.FILETIME ftLastWriteTime;
            public uint nFileSizeHigh;
            public uint nFileSizeLow;
            public uint dwReserved0;
            public uint dwReserved1;
            [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 260)]
            public string cFileName;
            [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 14)]
            public string cAlternateFileName;
        }

        [DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        public static extern IntPtr FindFirstFile(string lpFileName, out WIN32_FIND_DATA lpFindFileData);

        [DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        public static extern bool FindNextFile(IntPtr hFindFile, out WIN32_FIND_DATA lpFindFileData);

        [DllImport("kernel32.dll", SetLastError = true)]
        public static extern bool FindClose(IntPtr hFindFile);

        static readonly IntPtr INVALID_HANDLE_VALUE = new IntPtr(-1);
        static long globalMass = 0;

        static double CalculateEntropy(string filePath)
        {
            try
            {
                long[] counts = new long[256];
                long totalBytes = 0;
                using (FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
                {
                    byte[] buffer = new byte[8192];
                    int bytesRead;
                    while ((bytesRead = fs.Read(buffer, 0, buffer.Length)) > 0)
                    {
                        for (int i = 0; i < bytesRead; i++) counts[buffer[i]]++;
                        totalBytes += bytesRead;
                    }
                }
                if (totalBytes == 0) return 0;
                double entropy = 0;
                for (int i = 0; i < 256; i++)
                {
                    if (counts[i] > 0)
                    {
                        double p = (double)counts[i] / totalBytes;
                        entropy -= p * Math.Log(p, 2);
                    }
                }
                return Math.Round(entropy, 2);
            }
            catch { return 0; }
        }

        static void AnalyzeShadowVolume(string directory)
        {
            try
            {
                string driveLetter = Path.GetPathRoot(directory);
                DriveInfo drive = new DriveInfo(driveLetter);
                long physicalAllocated = drive.TotalSize - drive.TotalFreeSpace;
                long logicalMass = globalMass;
                long delta = physicalAllocated - logicalMass;
                
                Console.WriteLine("[VFS-SHADOW] " + physicalAllocated + "|" + logicalMass + "|" + delta);
            }
            catch { }
        }

        static void ScanDirectoryNative(string directory)
        {
            WIN32_FIND_DATA findFileData;
            string searchPath = directory + "\\*";
            IntPtr hFind = FindFirstFile(searchPath, out findFileData);

            if (hFind == INVALID_HANDLE_VALUE)
            {
                // Silently bypass System Volume Information and protected pages
                return;
            }

            do
            {
                string fileName = findFileData.cFileName;

                if (fileName == "." || fileName == "..")
                    continue;

                string fullPath = directory + "\\" + fileName;

                // Check if it's a directory
                if ((findFileData.dwFileAttributes & 0x00000010) == 0x00000010) 
                {
                    Console.WriteLine("[VFS-DIR] " + fullPath);
                    ScanDirectoryNative(fullPath);
                }
                else
                {
                    // It's a file, we could read mass here via nFileSizeHigh/Low
                    long fileSize = ((long)findFileData.nFileSizeHigh << 32) + findFileData.nFileSizeLow;
                    globalMass += fileSize;

                    if (fileName.EndsWith(".exe", StringComparison.OrdinalIgnoreCase) ||
                        fileName.EndsWith(".dll", StringComparison.OrdinalIgnoreCase) ||
                        fileName.EndsWith(".sys", StringComparison.OrdinalIgnoreCase) ||
                        fileName.EndsWith(".bin", StringComparison.OrdinalIgnoreCase))
                    {
                        if (fileSize >= 1024 * 1024 * 1024L) // 1GB+ Payload
                        {
                            try {
                                System.Diagnostics.Process p = new System.Diagnostics.Process();
                                p.StartInfo.FileName = "balancer.exe";
                                p.StartInfo.Arguments = "\"" + fullPath + "\"";
                                p.StartInfo.UseShellExecute = false;
                                p.StartInfo.RedirectStandardOutput = true;
                                p.Start();
                                string output = p.StandardOutput.ReadToEnd();
                                p.WaitForExit();
                                if (!string.IsNullOrEmpty(output)) Console.Write(output);
                            } catch {}
                        }
                        else
                        {
                            double entropy = CalculateEntropy(fullPath);
                            if (entropy >= 7.2)
                            {
                                Console.WriteLine("[VFS-ENTROPY] " + fullPath + "|" + entropy);
                            }
                        }
                    }
                }

            } while (FindNextFile(hFind, out findFileData));

            FindClose(hFind);
        }

        static void Main(string[] args)
        {
            Console.WriteLine("\n[PHASR] C# .NET ZERO-DEPENDENCY BYPASS INITIALIZED");
            Console.WriteLine("[PHASR] Bypassing Node.js V8 Engine... Hooking Kernel32 directly.\n");

            string targetDir = "C:\\";
            if (args.Length > 0)
            {
                targetDir = args[0];
            }

            Console.WriteLine("[PHASR] Commencing bare-metal scan on: " + targetDir);
            Console.WriteLine("[PHASR] Standby. Brute-forcing physical mass...\n");

            int startTime = Environment.TickCount;
            ScanDirectoryNative(targetDir);
            int endTime = Environment.TickCount;

            Console.WriteLine("[VFS-MASS] " + globalMass);
            AnalyzeShadowVolume(targetDir);
            Console.WriteLine("\n[PHASR] SCAN COMPLETE.");
            Console.WriteLine("[PHASR] Time Elapsed: " + (endTime - startTime) + " milliseconds.");
        }
    }
}
