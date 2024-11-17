# Windows-Update-Fix 🪄

Windows Update Fix Tool @ LEXARDEV
# Description
The Windows Update Fix Tool is a batch script designed to fix common issues with the Windows Update process. It helps resolve problems such as stuck updates, update failures, and corrupted update files by performing the following steps:

Stops key Windows Update-related services.
Deletes temporary files and folders related to Windows Updates.
Resets the SoftwareDistribution and catroot2 directories.
Restarts the necessary services to restore normal update functionality.
This tool is intended to provide a simple, one-click solution for resolving Windows Update problems.

# Features 📙
Stops critical update services to safely delete corrupt files.
Clears temporary files in the update directories to resolve common update issues.
Resets update-related folders (SoftwareDistribution and catroot2) for a fresh start.
Restarts update services after the cleanup to resume normal operations.
Usage
Download the script:

Download the Windows_Update_Fix_Tool.bat file to your computer.
Run the script:

Right-click on the script and select Run as administrator to ensure the necessary permissions are granted.
The script will automatically stop the Windows Update services, delete the temporary files, reset the update folders, and restart the services.
Completion:

After the script finishes, you will see a message indicating that the Windows Update fix was completed successfully.
Press any key to exit the script.
Prerequisites
Administrator privileges: You need to run the script as an administrator to ensure the services can be stopped and files can be deleted.
Windows operating system: This tool is designed for Windows environments only.
