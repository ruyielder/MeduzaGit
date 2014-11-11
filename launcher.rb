require 'Qt'
require 'rugged'
require_relative 'app/widgets/main_window'
require_relative 'app/helpers/desktop'

class Launcher
  include Desktop

  def initialize(argv)
    @argv = argv
    @repository_path = argv[0]
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

launcher = Launcher.new(['/home/pk/des/r'])
launcher.launch