require_relative 'commit'
require_relative 'humanized_time_difference'

class CommitFactory

  def create_from_rugged_commit(rugged_commit, is_remote)
    Commit.new(
        message: rugged_commit.message.chomp,
        author_name: rugged_commit.author[:name],
        time: rugged_commit.time,
        humanized_time_difference: HumanizedTimeDifference.between(rugged_commit.time, Time.now),
        is_remote: is_remote,
        sha: rugged_commit.oid
    )
  end

end