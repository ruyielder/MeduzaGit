require 'Qt'
require_relative 'commit_widget'


class CommitListWidget < Qt::ListWidget
  ITEM_HEIGHT = 100

  def initialize(parent, repository)
    super parent
    @repository = repository
  end

  def add_commit(commit)
    item = Qt::ListWidgetItem.new(self)
    item.setSizeHint(Qt::Size.new(0, ITEM_HEIGHT))
    commit_widget = CommitWidget.new(self, commit)
    add_item(item)
    set_item_widget(item, commit_widget)
  end

end