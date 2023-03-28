1. Create a Github Account (repository)
https://github.com/HardipinderS/cybe_595_mid_term
<!-- http://localhost:7990/mvc/projects/MID/repos/cyb_595/browse -->
2. Create a docker compose file and put it in the github account.
https://github.com/HardipinderS/cyb_595_mid_term
<!-- http://localhost:7990/projects/MID/repos/cyb_595/browse/compose.yml -->
3. Pull the docker compose file and build it. Push this container onto the github
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
docker login ghcr.io -u HardipinderS -p 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
docker tag hardipinders/cybe_595_mid_term ghcr.io/hardipinders/cyb_595_mid_term:latest
docker push ghcr.io/hardipinders/cyb_595_mid_term:latest

<!-- cd E:\courses_csudh\cyb 595\mid_term
git pull
docker-compose up -d --build
docker tag image_id localhost:7990/mid/cyb_595/mid_term-api:latest
docker push http://localhost:7990/mid/cyb_595/mid_term-api:latest -->


<!-- http://localhost:7990/scm/mid/cyb_595.git -->
4. Download an IDE (eclipse or any other) and connect to GitHub to check in or push. 
source control tab
5. Create Hello World in any language on the IDE
main.py
6. Create a test case in the framework of your choice
test_main.py
7. Use Jenkins to create a repo check in trigger
http://localhost:8080/job/mid_term_cyb_595/
8. On checking create a trigger to compile 
done
9. If compile is unsuccessful then email the user and put the failure in bug tracker (bugzilla or mantis or github issues).

10. if compile passes the run unit test and if that is successful email user un unit test passing
11. If both parts pass then deploy code on AWS EC2 instance using docker container with preset libraries.
12. All communication and code will be transmitted over ssl. 
13. Make a test case for secure static testing
14. Make a test case to dynamically test your program

Final devlivery is a video where you explain what you did and the issues you came across. 

docker-compose up -d --build

docker tag mid_term-api:latest kali/cyb_595

docker login http://localhost:7990/projects/MID/repos/cyb_595/browse

docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ad09f018173c

1. Choose a domain. example domain Healthcare, Defence, Education 
2. Create a network for a 5000 people in the company with around 15 departments in multiple buliding and multiple states. Use packet tracer to show the network. It needs have multiple sites segmented on multiple vlans. Automated IP assignment with multiple pools for each area. 
3. Explain the above created network
4. Explain how to secure the network
5. Add controls using the NIST and CIS Framework
6.  Explain what you are trying to address when you are addind controls
7. Create a video with a presentation to explain what you are doing above.