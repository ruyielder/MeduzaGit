require 'Qt'
require 'rugged'
require_relative 'app/widgets/main_window'
require_relative 'app/helpers/desktop'

class Launcher
  include Desktop

  def initialize(repository_path, argv=nil)
    @repository_path = repository_path
    @argv = argv || []
  end

  def launch
    repository = Rugged::Repository.new(@repository_path)
    app = Qt::Application.new(@argv)
    window = MainWindow.new(repository)
    window.show
    move_to_center(window)
    app.exec
  end

end

launcher = Launcher.new(Dir.pwd)
launcher.launch