echo "Starting to deploy docker image.."
docker pull ghcr.io/hardipinders/sec_dev_ops:latest
docker ps -q --filter ancestor=ghcr.io/hardipinders/sec_dev_ops | xargs -r docker stop
docker run -d -p 8080:8080 ghcr.io/hardipinders/sec_dev_ops