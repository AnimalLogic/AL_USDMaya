echo "Build AL_USDMaya"
docker build -t "usd-docker/alusdmaya:centos7-usd-0.18.9" -f docker/Dockerfile_centos7 .
