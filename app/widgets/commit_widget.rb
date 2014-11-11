require 'Qt'


class CommitWidget < Qt::Widget

    def initialize(parent, commit)
      super(parent)
      @commit = commit

      set_contents_margins(10, 10, 10, 10)
      @label = Qt::Label.new
      @label.parent = self
      @label.text = commit.message
    end

    def paintEvent(event)
      painter = Qt::Painter.new(self)
      painter.drawRect(rect)
      painter.end
    end

end