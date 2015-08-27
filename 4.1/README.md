Running GlassFish 4.1 Full Profile in Docker
-----------------------------------------
This image is based on the latest stable release of GlassFish 4.1. The default domain1 entries are:

 * Username: admin
 * Password: glassfish

To run the container, just do:

        # docker run -ti -p 4848:4848 -p 8080:8080 glassfish/full:4.1

This will give you the **asadmin** command line interface. Start the domain with **start-domain**

        asadmin> start-domain

If you want to change the password, ensure domain is stopped by calling **stop-domain**, then do:

        asadmin> change-admin-password

You can then exit and commit the container with the changed password to a newly named image. You can also use the source [Dockerfile](https://github.com/glassfish/docker/blob/master/4.1/Dockerfile) and extend from there.

To access the GlassFish Console, go to [http://localhost:4848/](http://localhost:4848/) to log into GF console using admin/glassfish. If you did not bind port 4848 to your host, find the container IP and access **http://<container-ip>:4848**.
