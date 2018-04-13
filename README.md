# Week 4: Bookmark Manager

### Day 1: Gadiza And Mary

#### Create user stories and domain model.

First user story:

- As a user, I would like to be able to see a list of bookmarks.
  So I can make a decision on which bookmark to click on.

  Objects | Messages
  -----------|-----------
  Person |
  Bookmark Manager | list bookmarks

#### Setting up a web project

In a new git repo, run `bundle init` to create a new Gemfile. Inside the Gemfile, we entered a bunch of core gems that we usually use on top of Capybara, Rspec and Sinatra.
`bundle install` will install the gems.
`rspec --init` creates the base RSpec files.


#### Setting up a database, creating first table, manipulating table data

We first ran `brew install postgresql` to install PostgreSQL, a relational database.

`$ psql` enters into PostgreSQL, and from there we can use the cheatsheet to navigate and manipulate databases from the terminal:
https://blog.jasonmeridth.com/posts/postgresql-command-line-cheat-sheet/

http://www.cheat-sheets.org/sites/sql.su/

`\q` quits back to the terminal.

Made an app.rb with BookmarkManager class, and made first feature test to view the links.
Changed the spec_helper.rb to require the app.rb and rspec and capybara.
Then made a lib/bookmark.rb file to put the Bookmark class in and a spec/bookmark_spec.rb to put the first unit tests in('returns all bookmarks'). Then made a views/index.erb to use in the app.rb, to show the bookmarks on the page.

#### Upgrading your toolset

We downloaded Tableplus and connected to the `bookmark_manager` database. From here, we can edit the database easily.

### Day 2: Gadiza and Sam

#### Interating with PostgreSQL from Ruby

We will be doing this via a gem called pg. This is a module that allows Ruby programs to interact with PostgreSQL database.

In order for pg to work, it needs to be included in the Gemfile, bundle installed, and then required in the `app.rb` file.

#### Setting up a testing environment

I first enabled ENV in spec-helper.

I created a `setup_test_database.rb` file, which essentially acts like a script that clears the database whenever RSpec is run, so that the data would be correct.
Created the bookmarks for the test environment.

installed sinatra-flash to use flash notice in the app file. And uri. Enabled sessions for flash to work and made a flash[:notice] for a user to submit a valid URL.
New unit tests and feature tests for bookmark if the URL is not valid.

### Day 3: Gadiza and Jihin

#### Validating bookmarks

uri is a built in module from Ruby that allows checking of urls. Documentation can be found here:
https://stackoverflow.com/questions/1805761/how-to-check-if-a-url-is-valid

We first wrote tests for `bookmark_spec.rb` that returns a false boolean if an invalid link has been entered. From there, following documentation for uri, I pasted in a line that evaluates a string for a URL.


#### Wrapping database data in Program Objects

We first started to rewrite the tests in order to meet the new specifications outlined in the challenge.  While doing so, we have realised that Gadiza's RSpec was not clearing the test database for each test, and was only doing it at the beginning of the run. We sorted out the syntaxing mistake that she had, and then also changed the loop in the `spec_helper` from `require_relative` to `load` in order to get it to work.

### Day 4 Gadiza and Matthew

#### Adding create button

We went through the code that we had written and made a create button to add a new bookmark. We first added a feature test to see if there is a button. Then made a new post '/bookmarks/new' in the app.rb, with a erb file to create a button and redirect us to the '/bookmarks' page.

Then we changed the post '/bookmarks' in the app to only make a bookmark if the user submits a valid url and a title.

#### Adding link to website

We started with making a feature test that checks if there is a link to the website if you click on the title. Changed bookmark.rb to give Bookmark urls as links.
We changed the app.rb so you can update the title if you try to create a bookmark with a url that is already in the database.
Then added a method for the url to be returned as a string
We made a feature test to make a delete button for each bookmark to make it possible to delete the bookmarks you want out of the database. Got the deletebutton working after a long time trying.
