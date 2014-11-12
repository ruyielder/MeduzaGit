require_relative 'commit_factory'

class CommitWalker
  include Enumerable

  def initialize(repository, commit_factory=nil)
    @repository = repository

    branch_name = get_current_branch_name(repository.head.name)
    @branch = repository.branches[branch_name]

    remote_branch_name = "origin/#{branch_name}"
    @remote_branch = repository.branches[remote_branch_name]

    @commit_factory = commit_factory || CommitFactory.new
  end

  def each
    walker = Rugged::Walker.new(@repository)
    walker.push(@branch.target)

    is_remote = false

    walker.each do |rugged_commit|
      unless is_remote
        is_remote = rugged_commit == @remote_branch.target
      end

      yield @commit_factory.create_from_rugged_commit(rugged_commit, is_remote)
    end
  end

  private

  def get_current_branch_name(head_name)
    head_name.split('/')[-1]
  end

end