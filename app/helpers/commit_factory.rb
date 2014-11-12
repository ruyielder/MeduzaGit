require_relative 'commit'

class CommitFactory

  def create_from_rugged_commit(rugged_commit, is_remote)
    Commit.new(rugged_commit.message, is_remote)
  end

end