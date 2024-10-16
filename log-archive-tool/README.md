Instructions:
Save the script: Save the above code into a file called log-archive.sh.

Make the script executable:
```bash
chmod +x log-archive.sh
```
Run the tool: You can run the tool from the command line by providing the log directory as an argument:
```bash
./log-archive.sh /path/to/log/directory # or generally linux ubuntu uses /var/log/
```
Output: The logs will be compressed into a tar.gz file named logs_archive_<timestamp>.tar.gz and stored in /workspaces/Roadmap-DevOps/log-archive-tool.
The timestamp is in the format YYYYMMDD_HHMMSS, and the log archive date and time will be saved in archive_log.txt.