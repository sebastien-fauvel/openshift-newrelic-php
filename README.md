# sebastien-fauvel/openshift-newrelic-php
This is a Do-It-Yourself Cartridge to deploy PHP applications on OpenShift and monitor them with New Relic.

For more information about the hosting platform OpenShift and the application and server monitoring tools of New Relic,
please visit https://www.openshift.com/ and http://newrelic.com/

## What's inside

**The `.openshift/action_hooks` scripts:**

* `build`:
    - Builds and installs the requested versions of nginx, PHP, NodeJS and New Relic
* `build_*`:
    - Helper functions used for installing software
* `common`:
    - A common configuration script for the action hooks
* `deploy`:
    - Configures nginx, PHP and the bash profile
    - Installs and runs composer
    - Sends deployment notification to New Relic
* `start`:
    - Starts nginx, PHP and New Relic server monitoring
* `stop`:
    - Stops nginx, PHP and New Relic server monitoring

**The `.openshift/tmpl` templates:**

Template files used by the build and deployment scripts to configure nginx, PHP, PHP extensions as well as the bash profile.

**The `php` folder:**

Root directory served by nginx. You can change this in `.openshift/tmpl/nginx.conf.tmpl`.

**The `etc` folder:**

Put your New Relic API key and define your application name in `etc/newrelic`.

## Usage

To deploy your application on OpenShift, you just have to do the following:

1. Create an [OpenShift account](https://www.openshift.com/) if you don't have one already.
2. Create a new OpenShift "Do-It-Yourself" application. You can either use [OpenShift's web console](https://openshift.redhat.com/app/console/applications), or use the [OpenShift Client tools](https://developers.openshift.com/en/getting-started-client-tools.html) to create your application from the command line, with `rhc app create myapp diy-0.1`.
3. Clone this repository and add a new remote `openshift` pointing to your OpenShift repository. You can either use the web console to find its URL on the application page, or use `rhc app show myapp`.
4. Enter your New Relic API key in `etc/newrelic` and commit.
5. Run `deploy.sh` and wait for the build to finish (this may take several hours).
6. Open your application in a web browser to verify.
7. Check your application and server monitoring data in New Relic.
8. When you commit some code, run `deploy.sh` or simply `git push openshift master` to deploy it to OpenShift.

## Thanks

Thanks to the following people:

* [@boekkooi](https://github.com/boekkooi)
* [@sgoettschkes](https://github.com/Sgoettschkes)
* [@drejohnson](https://github.com/drejohnson)
* [@weierophinney](https://github.com/weierophinney)
* [@openshift](https://github.com/openshift/)
