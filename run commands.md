docker build -t pig:0.0.0.2 .

docker run -d -p 8000:443 --name pig pig:0.0.0.2