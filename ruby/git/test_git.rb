require 'rubygems'
require 'git'
require 'test/unit'

class GitTest < Test::Unit::TestCase
  def test_git_init
    york_repo = 'york.git'
    york = Git.init '.', :repository => york_repo
    assert_equal 120, york.repo_size

    newyork_dir = 'newyork'
    newyork = Git.clone york_repo, newyork_dir
    assert_equal 'origin', newyork.remote.name
    assert_equal 'master', newyork.branch.name
    assert_equal 128, newyork.repo_size
    open("#{newyork_dir}/readme.txt", 'w') { |f| f.write 'hello' }
    newyork.add
    newyork.commit 'hello'
    newyork.push 'origin', 'master'

    newyorker_dir = 'newyorker'
    newyorker = Git.clone york_repo, newyorker_dir
    assert_equal 200, newyorker.repo_size
    newyorker_readme = open("#{newyorker_dir}/readme.txt").read
    open("#{newyorker_dir}/readme.txt", 'w') do |f|
      f.write "#{newyorker_readme} world"
    end
    newyorker.commit 'add world', :add_all => true
    newyorker.push 'origin', 'master'

    assert_equal 208, newyork.repo_size
    newyork.fetch 'origin'
    assert_equal 240, newyork.repo_size
    newyork.merge 'master'
    assert_equal 248, newyork.repo_size
    `cd #{newyork_dir} && git pull origin master 2> /dev/null`
    assert_equal 'hello world', open("#{newyork_dir}/readme.txt").read

    FileUtils.rm_rf york_repo
    FileUtils.rm_rf newyork_dir
    FileUtils.rm_rf newyorker_dir
  end
end
