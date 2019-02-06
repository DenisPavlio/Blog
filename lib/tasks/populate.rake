namespace :fill do
  desc 'Fill data'
  task data: :environment do
    require 'faker'
    require 'populator_fixes.rb'
    require 'populator'
    puts 'Erasing existing data'
    puts '====================='

    [User, Post, Comment, Category].each(&:delete_all)
    ActsAsVotable::Vote.delete_all

    puts 'Creating users'
    puts '=============='
    password = 'password'

    User.populate 20 do |user|
      user.name = Faker::Name.name
      user.email = Faker::Internet.email
      user.encrypted_password = User.new(password: password).encrypted_password
      puts "created user #{user.email}"
    end

    # user = User.new(name: 'Mykyta Didenko', email: 'ndidenko@matcha.com', sex: 'male', password: 'password')
    # user.skip_confirmation!
    # user.save!
    # puts 'Created test user with email=ndidenko@matcha.com and password=password'
    #
    # for i in 1..5
    #   user = User.new(name: "test#{i}", email: "test#{i}@matcha.com", sex: 'male', password: 'password')
    #   user.skip_confirmation!
    #   user.save!
    #   puts "Created test user with email=test#{i}@matcha.com and password=password"
    # end

    puts 'Creating Categories'
    puts '==================='
    30.times do
      category = Category.new
      category.name = Faker::NewGirl.character + ' . ' + Faker::Number.number(1)
      category.save
      puts "created category #{category.name}"
    end

    puts 'Creating Posts'
    puts '=============='
    users = User.all
    categories = Category.all

    150.times do
      post = Post.new
      post.content = Populator.sentences(2..10)
      post.user = users.sample
      post.category = categories.sample
      post.save!
      puts "created post #{post.id}"
    end

    puts 'Creating Comments For Posts'
    puts '==========================='

    posts = Post.all

    300.times do
      post = posts.sample
      user = users.sample
      comment = post.comments.new
      comment.comment = Populator.sentences(1)
      comment.user = user
      comment.save
      puts "user #{user.name} commented on post #{post.id}"
    end

    puts 'Creating Likes For Posts'
    puts '========================'

    300.times do
      post = posts.sample
      user = users.sample
      post.liked_by user
      puts "post #{post.id} liked by user #{user.name}"
    end
  end
end