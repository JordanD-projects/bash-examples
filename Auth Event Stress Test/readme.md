# What is Auth Event Stress Test?
- It's a simple tool to generate auth events so we can verify Protect handles them properly. It is not malicious. 

- To use it, set the variables for `NUM_ITERATIONS` (the number of times you want the script to loo[]), `SOURCE_DIR` (the path to helloworld.c), and `TARGET_DIR` (where you want all of the .c files to be created. Example: `/Users/jordan/Desktop/Output`) and then run `auth-event-stress-test.sh` via Terminal. 