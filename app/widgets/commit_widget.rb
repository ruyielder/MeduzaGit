require 'Qt'


class CommitWidget < Qt::Widget

    def initialize(parent, commit)
      super(parent)
      @commit = commit
    end

end