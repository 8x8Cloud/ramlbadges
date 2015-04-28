# ramlbadges
Github repo hook to validate a RAML file, test endpoints and produce a badge png URL.

# Problem statement
Build an app or service that can recieve a github repo web hook from a commit and find any [RAML](http://raml.org) files. Parse them for their RESTful API endpoints that contain sample formats and check the associated endpoint. Based on the returning object matching what is represented in the RAML file, generate per API badge images. Similar to a build success badge one would see from a travis-ci build.

# Requirements
* Whatever language you are comfortable using
* Maintain your code in this repo
* Leverage http://shields.io ![](https://img.shields.io/badge/raml-verified-green.svg)

# Bonus
* Parse multiple RAML files per repo. Each file having a distinct "baseURI". Essentially one badge respresenting the endpoint tested on each specific environment (dev, staging, production, etc.) 
* Show the badges in document generated from RAML ([raml2html](https://www.npmjs.com/package/raml2html))
* Allow web hooks for continuous delivery systems to react based on pass/fail of endpoint verification

# Presentation
Present your work to our team via screen sharing session. Talk about the approach you took. Demo.
