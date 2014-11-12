require 'Qt'
require_relative '../../app/helpers/commit_provider'
require_relative '../../app/helpers/commit_paginator'
require_relative 'commit_widget'

class CommitListWidget < Qt::ListWidget
  ITEM_HEIGHT = 60
  COMMITS_PER_PAGE = 20

  def initialize(parent, repository)
    super parent
    @repository = repository
    commit_provider = CommitProvider.new(repository)
    @commit_paginator = CommitPaginator.new(commit_provider, COMMITS_PER_PAGE)
    @commit_paginator.current_page.each {|commit| add_commit commit}
  end

  def add_commit(commit)
    item = Qt::ListWidgetItem.new(self)
    item.setSizeHint(Qt::Size.new(0, ITEM_HEIGHT))
    commit_widget = CommitWidget.new(self, commit)
    add_item(item)
    set_item_widget(item, commit_widget)
  end

  def display_prev_items
    clear
    @commit_paginator.backward
    @commit_paginator.current_page.each {|commit| add_commit commit}
  end

  def display_next_items
    clear
    @commit_paginator.foreward
    @commit_paginator.current_page.each {|commit| add_commit commit}
  end

  def has_next_items?
    @commit_paginator.has_next_page?
  end

  def has_prev_items?
    @commit_paginator.has_prev_page?
  end

end