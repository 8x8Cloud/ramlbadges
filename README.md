# Project Planning and Research

## Objective

Github repo hook to validate a RAML file, test endpoints and produce a badge png URL.

## Problem Statement

* Build an app or service that can recieve a github repo web hook from a commit and find any RAMLfiles. 
* Parse them for their RESTful API endpoints that contain sample formats and check the associated endpoint. 
* Based on the returning object matching what is represented in the RAML file, generate per API badge images. 
* Similar to a build success badge one would see from a travis-ci build.

## Requirements
* Whatever language you are comfortable using
* Maintain your code in [this repo](https://github.com/8x8Cloud/ramlbadges)
* Leverage [http://shields.io](http://shields.io)

## Bonus Items
* Parse multiple RAML files per repo. Each file having a distinct "baseURI". Essentially one badge respresenting the endpoint tested on each specific environment (dev, staging, production, etc.)
* Show the badges in document generated from RAML ([raml2html](https://www.npmjs.com/package/raml2html))
* Allow web hooks for continuous delivery systems to react based on pass/fail of endpoint verification

***

## Notes

* It would be cool if this service could be configured to use any repository. Like, when someone installs it they can set their Git credentials and choose a repository to apply the Webhook to. This can be done through the Github Webhooks API.

## Todo
* R&D Github web hooks
* R&D RAML
* R&D `shields.io` usage
* Setup `gitflow`
* Do some scratching
* Implement PORO classes to do problem statement work
    * TDD?
* Build out web service (Rails? Sinatra?)
* Deploy to web faction (or somewhere public)
    * How about just figuring out how to use `ngrok`?
* Implement bonus items …

## Links
### Github Web Hooks
* [Repository Webhooks | GitHub API](https://developer.github.com/v3/repos/hooks/)
* [Creating webhooks | GitHub API](https://developer.github.com/webhooks/creating/)
* [Webhooks | GitHub API](https://developer.github.com/webhooks/)
* [Event Types & Payloads | GitHub API](https://developer.github.com/v3/activity/events/types/)
* [Webhooks level up](https://github.com/blog/1778-webhooks-level-up)
* [octokit/octokit.rb](https://github.com/octokit/octokit.rb)
* [ssaunier/github\_webhook](https://github.com/ssaunier/github_webhook)
* [github/github-services](https://github.com/github/github-services)
* [ngrok - download](https://ngrok.com/download)
* [Event Types & Payloads | GitHub API (Push event)](https://developer.github.com/v3/activity/events/types/#pushevent)

### RAML
* [RAML - RESTful API modeling language](http://raml.org/)
* [RAML - RESTful API modeling language (Tutorial)](http://raml.org/docs.html)
* [RAML - RESTful API modeling language (Projects)](http://raml.org/projects.html)

### Shields.io

### Deploying
* [AWS Free Tier](http://aws.amazon.com/free/)
* [Heroku | Pricing](https://www.heroku.com/pricing)
* [Ruby on Rails — WebFaction Software Documentation](https://docs.webfaction.com/software/rails.html)
### Misc.
* [NationBuilder Webhooks - Brad Johnson](http://www.bradleymosesjohnson.com/blog/2013/11/13/nationbuilder-webhooks/)
* [Sinatra](http://www.sinatrarb.com/)
* [Using Webhooks with Rails - Stack Overflow](http://stackoverflow.com/questions/21219313/using-webhooks-with-rails)
* 