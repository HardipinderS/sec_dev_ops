1. Create a Github Account (repository)

2. Create a docker compose file and put it in the github account.


3. Pull the docker compose file and build it. Push this container onto the github

4. Download an IDE (eclipse or any other) and connect to GitHub to check in or push. 

5. Create Hello World in any language on the IDE

6. Create a test case in the framework of your choice

7. Use Jenkins to create a repo check in trigger

8. On checking create a trigger to compile 

9. If compile is unsuccessful then email the user and put the failure in bug tracker (bugzilla or mantis or github issues).

10. if compile passes the run unit test and if that is successful email user un unit test passing
11. If both parts pass then deploy code on AWS EC2 instance using docker container with preset libraries.
12. All communication and code will be transmitted over ssl. 
13. Make a test case for secure static testing
14. Make a test case to dynamically test your program

Final devlivery is a video where you explain what you did and the issues you came across. 
