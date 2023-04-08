# syntax = docker/dockerfile:1.4

FROM ghcr.io/hardipinders/sec_dev_ops
COPY ./app ./app
WORKDIR ./app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
# WORKDIR /.

# COPY requirements.txt ./
# RUN --mount=type=cache,target=/root/.cache/pip \
#     pip install -r requirements.txt

# COPY ./app ./app

# FROM builder as dev-envs

# RUN <<EOF
# yum update
# yum install -y --no-install-recommends git
# EOF

# RUN <<EOF
# useradd -s /bin/bash -m vscode
# groupadd docker
# usermod -aG docker vscode
# EOF
# # install Docker tools (cli, buildx, compose)
# COPY --from=gloursdocker/docker / /
