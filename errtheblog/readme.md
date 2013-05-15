--- 
readme: |-
  This is some silly stuff I just added.
  
  But if you want to contribute something useful here, then just visit http://cheat.errtheblog.com/ and add it.
  
  Or use: cheat --edit readme
  
  Tom's Silly Stuff
  =================
  
  $ cheat --add readme
  
  Git Submodules
  ==============
  See Scott Schacon's submodules screencast on gitcasts.com or Blip.tv.
  (For a great screencast on Git, see
  http://blip.tv/scott-chacon/git-talk-4113729 .)
  To use a Git project that uses submodules:
  $ git clone git://github.com/schacon/gitrack.git
  $ git submodule init # Inits submodules (registers them for paths in the wdir)
  $ cat .gitmodules
  $ git submodule update
  $ git submodule status
  
  Tom's Cucumber-with-Rails-3 Notes
  =================================
  
  We assume here you have created an RVM gemset in your project directory.
  See <project-directory>/.rvmrc and the output of 'rvm info' to check it.
  
    Add the following to the project's Gemfile:
    ===========================================
    group :development do
      gem 'rspec-rails'
    end
  
    group :test do
      gem 'rspec'
      gem 'cucumber-rails'
      gem 'webrat'
      gem 'capybara'
      gem 'database_cleaner'
    end
  
    Run this command after changing the Gemfile:
    ============================================
    bundle
