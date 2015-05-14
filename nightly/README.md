Running GlassFish 4.1 Nightly in Docker
-----------------------------------------
Default domain1 entries are:

 * Username: admin
 * Password: glassfish

To run the container, just do:

        # docker run -ti -p 4848:4848 -p 8080:8080 glassfish/nightly

To change password after you run the container, do:

        asadmin> change-admin-password

You must restart the container after password is changed.

To access the GlassFish Console, go to [http://localhost:4848/](http://localhost:4848/) to log into GF console using admin/glassfish.
