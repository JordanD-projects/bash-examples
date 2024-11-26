# Docker Stress Test tool.
- This tool is designed to run a series of stress tests which are included as .sh scripts in parallel a certain number of iterations inside of an Ubuntu Docker image. Once the test completes, it will export a diagnostic file from Jamf Protect. When it begins, it will also start a log stream of the activity of the Protecy Extension in another Terminal window for debiugging purposes. Please read "How to use this tool" for more details. 

# How to use this tool
- Before running the benchmark, please go into the `dockerfile` file and set the `ENV RUN_X_X` example: `RUN_EICAR` to `0` to skip the test or `1` to run the test and make sure Docker is installed and running. 

- To run the benchmark you must navigate to the location on your computer where you stored the docker file (example: `cd /Users/your_username/Documents/repos/jprotect-testing-resources/Stress Testing/Docker Stress Test/`) and then run `sudo sh  run_benchmark.sh` to begin the benchmark. 

- When the benchmark starts, it will open anotehr Terminal window with a log stream for the Jamf Protect Extension for real-time debugging purposes. This can be disabled in the `run_benchmark.sh` file if not needed. 

- Once the benchmark completes, it will output a `protectctl diagnostics` zip file to your desktop which you can use to validate how well the system managed the benchmark.

- Please note that even if you end the benchmark in the Terminal window, it will keep running in the background of your computer. To fully stop it, you need to quit out of the Terminal window that started the benchmark. 

- If you are seeing an error like ` => ERROR [internal] load metadata for docker.io/library/ubuntu:latest` when first running the image, please run `sudo vi ~/.docker/config.json`, then set `"credsStore": "Desktop.exe"` to `"credStore": "Desktop.exe"` (remove the "s"), and then run `docker login`

# Inforamtion on adding a new script to this project
When adding a new script, you will need to add it in three places:
1. Place the new script in the `Docker Stress Test` folder
2. Update the file `dockerfile`. You can also add any environment (`ENV`) variables here such as `NUM_ITERATIONS`
3. Update the `entrypoint.sh` to actually run the script

## Helpful commands
NOTE: This is done automatically when running the `run_benchmark.sh` file to start a benchmark so you only need to run these commands if you don't want to run the full suite of tests. 

- If you make modifications to any files and want to rebuild the image, run this command:
`docker build -t file-stress-test .`

- If you want to run the image itself, use this command (the best method would be run it through `sudo sh  run_benchmark.sh` as shown above):
`docker run -it --rm file-stress-test`

## If you are having issues with Docker crashing during your tests, try the following:

1. Locate the Docker daemon configuration file. Depending on your operating system, it could be located at /etc/docker/daemon.json or /etc/default/docker.
- If the file doesn't exist, you may need to create it.
- Open the configuration file in a text editor.
2. Set Max Concurrent Builds:
- Add or modify the max-concurrent-builds option in the Docker daemon configuration file.
- Set the value to an appropriate number based on the capabilities of your host machine and the intensity of your stress tests.
- For example:
```
{
  "max-concurrent-builds": 5
}

```
3. Restart Docker Daemon: After making changes to the Docker daemon configuration file, you need to restart the Docker daemon to apply the changes.
- Use the appropriate command for your system. For example:
```
sudo systemctl restart docker   # For systems using systemd
sudo service docker restart      # For systems using sysvinit
```
