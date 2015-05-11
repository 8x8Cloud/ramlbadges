# Sierra Madre

> Badges? We don't need no stinking badges!!

The first movie to use this phrase (albeit a longer version) was [Sierra Madre][1].

# Things You'll Want (and need) to Have Installed

* `Ruby 2.0`
* `Rails 4.2.0`
* [`ngrok`][2] (optional if you're deploying elsewhere)
* [`raml2html`][3]

# Up and running in 10 easy steps

1. Clone this repo
2. Fill in your Github credentials in `secrets.yml` (*prevents API rate limiting*)
    * `username: [YOUR GITHUB USERNAME]`
    * `password: [YOUR GITHUB PASSWORD`
3. `bundle install`
4. `rake db:migrate`
5. `rails s -b 127.0.0.1`
    * The `-b` is used so `ngrok` can bind properly.
6. Start `ngrok`
    * `ngrok 3000`
7. Grab your `ngrok` **Forwarding** URL
    * **Example**: `http://a365098.ngrok.com`
8. Add the webhook to your repository (public repos only at this time)
    * **Example**: `http://a365098.ngrok.com/push/create`
    * Set **Content-Type** to `application/json`
    * Select **Just the `push` event**
    * Check the **Active** checkbox
    * Click **Update webhook**
9. Push a commit that adds or modifies a `.raml` file
10. See your RAML file's valid status and documentation ... like a ***boss***!!

# Tests

The tests for this app were built using `rspec`. In order to run them, just type `rspec` at the command line after cloning the repo.

# TODO

* Complete code coverage
    - The last few iterations were done cowboy style (to get the app ready for the 8x8 crew) so there is some untested code.
* Test views
* Test unhappy paths
    - I focused on only testing the happy path during TDD.
    - There are *lots* of places where errors can cause problems and no tests for these edge cases have been written.
* Use `ngrok` for ALL THE THINGS!!!

[1]:http://en.wikipedia.org/wiki/Stinking_badges
[2]:https://ngrok.com/
[3]:https://www.npmjs.com/package/raml2html