require_relative 'commit'

class CommitFactory

  def create_from_rugged_commit(rugged_commit)
    Commit.new(rugged_commit.message)
  end

end