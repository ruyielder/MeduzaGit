class CommitPage
  include Enumerable

  def initialize(commits)
    @commits = commits
  end

  def each
    @commits.each {|commit| yield commit}
  end

  def size
    @commits.size
  end

end
