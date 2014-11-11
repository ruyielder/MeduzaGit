require 'Qt'
require_relative 'latest_commit_list_widget'
require_relative '../core/commit'


class MainWindow < Qt::MainWindow

  def initialize(repository)
    super nil
    set_window_title 'MeduzaGit'

    list_widget = LatestCommitListWidget.new(self, repository)
    set_central_widget(list_widget)
  end

end