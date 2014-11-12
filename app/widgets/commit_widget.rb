require 'Qt'


class CommitWidget < Qt::Widget

    def initialize(parent, commit)
      super(parent)
      @message_label = Qt::Label.new
      @description_label = Qt::Label.new
      @commit = commit
      setup_widgets
      setup_layout
    end

    def setup_widgets
      @message_label.text = @commit.message
      @message_label.font = Qt::Font.new('Verdana', 15)
      @description_label.text = "przez #{@commit.author_name} #{@commit.humanized_time_difference}"
    end

    def setup_layout
      layout = Qt::HBoxLayout.new(self)
      layout.spacing = 0
      left_layout = Qt::VBoxLayout.new
      left_layout.spacing = 0
      left_layout.set_contents_margins(10, 10, 10, 10)
      left_layout.add_widget(@message_label)
      left_layout.add_widget(@description_label)
      layout.add_layout(left_layout)
      set_layout(layout)
    end


    def paintEvent(event)
      painter = Qt::Painter.new(self)
      painter.drawRect(rect)
      painter.end
    end

end