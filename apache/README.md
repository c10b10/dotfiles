The `httpd.conf` gets deployed using (apache-deploy-conf) to the location where apache expects it to
be because we can't use symlinks for that.

The `httpd-vhosts-template.conf` file is a template for the untracked
`httpd-vhosts.conf` file which should store your vhosts and which is automatically included by httpd.conf.
Make sure httpd.conf is correctly configured by searching for the string
"#c10".
