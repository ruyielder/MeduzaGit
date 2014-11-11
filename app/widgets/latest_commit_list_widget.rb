require_relative 'commit_list_widget'

class LatestCommitListWidget < CommitListWidget

  def initialize(parent, repository)
    super(parent, repository)
    walker = Rugged::Walker.new(@repository)
    walker.push(@repository.last_commit)
    walker.each {|commit| add_commit commit}
  end

end