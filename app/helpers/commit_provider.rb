require 'rugged'

class CommitProvider

  def initialize(repository)
    @repository = repository
  end

  def get_commits(from_index, to_index)
    commits = []
    walker = Rugged::Walker.new(@repository)
    walker.push(@repository.last_commit)
    walker.each_with_index do |commit, index|
      if from_index <= index && index < to_index
        commits << commit
      elsif index >= to_index
        return commits
      end
    end

    commits
  end

end
