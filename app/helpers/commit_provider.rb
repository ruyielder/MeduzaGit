require 'rugged'
require_relative 'commit_factory'

class CommitProvider

  def initialize(repository, commit_factory=nil)
    @repository = repository
    @commit_factory = commit_factory || CommitFactory.new
  end

  def get_commits(from_index, to_index)
    commits = []
    walker = Rugged::Walker.new(@repository)
    walker.push(@repository.last_commit)
    walker.each_with_index do |rugged_commit, index|
      if from_index <= index && index < to_index
        commits << @commit_factory.create_from_rugged_commit(rugged_commit)
      elsif index >= to_index
        return commits
      end
    end

    commits
  end

end
