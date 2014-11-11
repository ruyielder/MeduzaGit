require 'Qt'
require_relative 'list_widget_paginator_widget'
require_relative 'commit_list_widget'

class MainWindow < Qt::MainWindow

  def initialize(repository)
    super nil
    set_window_title 'MeduzaGit'

    list_widget = CommitListWidget.new(self, repository)
    list_widget_navigator = ListWidgetPaginatorWidget.new(self, list_widget)
    set_central_widget(list_widget_navigator)
  end

end