Running GlassFish 5.0 Nightly in Docker
-----------------------------------------
Default domain1 entries are:

 * Username: admin
 * Password: glassfish

To run the container, just do:

        # docker run -ti -p 4848:4848 -p 8080:8080 glassfish/nightly

This will give you the **asadmin** command line interface. Start the domain with **start-domain**

        asadmin> start-domain

If you want to change the password, ensure domain is stopped by calling **stop-domain**, then do:

        asadmin> change-admin-password

You can then exit and commit the container with the changed password to a newly named image. You can also use the source [Dockerfile](https://github.com/glassfish/docker/blob/master/nightly/Dockerfile) and extend from there.

To access the GlassFish Console, go to [http://localhost:4848/](http://localhost:4848/) to log into GF console using admin/glassfish. If you did not bind port 4848 to your host, find the container IP and access **http://<container-ip>:4848**.
