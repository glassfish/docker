Running Ozark Samples in Docker Container
-----------------------------------------

1) Setup Docker from docker.com. If running on a Mac, you'd need to install boot2docker.

2) Run the Ozark image

  # docker run -ti -p 4848:4848 -p 8080:8080 -p 8181:8181 glassfish/ozark

4) Open browser window at http://localhost:8080/samples

5) Use http://localhost:4848/ to log into GF console using admin/ozark.

