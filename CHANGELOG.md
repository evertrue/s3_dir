s3_dir CHANGELOG
================

v2.0.0 (2017-01-18)
-------------------

* Update dependencies to resolve dephell w/ `et_fog`
* Refactor LWRP → Chef 12.5 Custom Resource w/ backwards compat to Chef ~> 12.1
* Add ability to use an IAM profile (#6, @mlakewood)
* Remove file mode changing due to potential for illegal modes and all files being made executable (#6, @mlakewood)
* Update Travis testing to use ChefDK & add Ubuntu 16.04
* Clean up ChefSpec & integration testing

v1.4.2 (2015-11-18)
-------------------

* Fix recursive directory creation (h/t to @alex-pekurovsky & @eherot)
* Update the testing harnesses to bring it more up-to-date
* Update gems
* Better caching of Travis testing resources

v1.4.1 (2014-10-21)
-------------------

* Update ChefSpec matchers to follow deprecations
* Update gems
* Refactor Travis config
* Update Serverspec spec_helper to work w/ Serverspec v2

v1.4.0 (2014-10-01)
-------------------

* Move test code to its own embedded cookbook
* Allow alternate regions

v1.3.0 (2014-08-26)
-------------------

* Add non-us-east-1 region support

v1.2.3 (2014-08-26)
-------------------

* Fix the way we parse directory listings so that arrays stop turning up empty

v1.2.2 (2014-08-15)
-------------------

* Several changes to get Travis-CI working in full-convergence mode.

v1.2.1 (2014-08-14)
-------------------

* Fix the unit tests to match the code

v1.2.0 (2014-08-14)
-------------------

* Do all testing with mock instead of depending on a private external s3 bucket.

v1.1.0 (2014-07-21)
-------------------

* README cleanup
* LICENSE and maintainer info clarified
* Clean up testing situation
    - ChefSpec test
    - Serverspec integration tests
* Fix FC016 by adding a default action to LWRP
* Fix dependency on et_fog to properly resolve
* Add default values for `s3_dir` attributes
* Fix issue with mode attribute and implicit conversion b/t strings/integers

v1.0.1 (2014-06-23)
-------------------

* Real README
* File mode parsing to make directories

v0.1.0 (2014-06-23)
--------------------

* Initial release of s3_dir
