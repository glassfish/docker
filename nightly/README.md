Running GlassFish 4.1 Nightly in Docker
-----------------------------------------
Default domain1 entries are:

 * Username: admin
 * Password: glassfish

To run the container, just do:

        # docker run -ti -p 4848:4848 -p 8080:8080 glassfish/nightly

This will give you the **asadmin** command line interface. Start the domain with **start-domain**

        asadmin> start-domain

If you want to change the password, ensure domain is stopped, then run do:

        asadmin> change-admin-password

You can then exit and commit the container to an image with the changed password.

To access the GlassFish Console, go to [http://localhost:4848/](http://localhost:4848/) to log into GF console using admin/glassfish.
