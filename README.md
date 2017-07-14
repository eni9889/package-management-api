***How To Run Locally:***

- Clone this repo: `git clone git@github.com:eni9889/package-management-api.git`
- Install RVM: `\curl -sSL https://get.rvm.io | bash -s stable --ruby`
- Install Bundler: `gem install bundler`
- Install Homebrew: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- Install Postgres: `brew install postgresql`
- Start Postgres: `brew services start postgresql`
- Then install the necessary packages:
  - `cd package-management-api`
  - `bundle install`
- Start the local server: `bundle exec rails server -b 0.0.0.0 -p 3000 -e development`
- Visit http://0.0.0.0:3000/v1/packages and you should see an empty JSON array
