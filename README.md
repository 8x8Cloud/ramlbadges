# Sierra Madre

> Badges? We don't need no stinking badges!!

The first movie to use this phrase (albeit a longer version) was [Sierra Madre][1].

# Up and running in 5 minutes

1. Clone this repo
2. Fill in your Github credentials in `secrets.yml` **prevents API rate limiting*
    * `username: [YOUR GITHUB USERNAME]`
    * `password: [YOUR GITHUB PASSWORD`
3. Migrate your database
    * `rake db:migrate`
4. Run the server
    * `rails s -b 127.0.0.1`
    * The `-b` is used for `ngrok` to bind properly.
5. Start `ngrok`
    * `ngrok 3000`
6. Grab your `ngrok` **Forwarding** URL
    * **Example**: `http://a365098.ngrok.com`
7. Add the webhook to your repository (public repos only at this time)
    * **Example**: `http://a365098.ngrok.com/push/create`
    * Set **Content-Type** to `application/json`
    * Select **Just the `push` event**
    * Check the **Active** checkbox
    * Click **Update webhook**
8. Push a commit that adds or modified a `.raml` file
9. See your RAML file's valid status and documentation ... like a ***boss***!!

[1]:http://en.wikipedia.org/wiki/Stinking_badges