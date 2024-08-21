# Build
To build the container run: 

`docker build -t parrotos-6-desktop-developer .`

# Run
To run the container:

`sudo docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_PW=password -v ~/kasm-user:/home/kasm-user parrotos-6-desktop-developer`

# Connect
https://localhost:6901

username: kasm_user
password: $(VNC_PW)