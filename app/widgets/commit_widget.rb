require 'Qt'


class CommitWidget < Qt::Widget
  slots :copy_commit_sha

  def initialize(parent, commit)
    super(parent)
    @message_label = Qt::Label.new
    @description_label = Qt::Label.new
    @copy_sha_button = Qt::PushButton.new(self)
    @commit = commit
    setup_widgets
    setup_slots
    setup_layout
  end

  def setup_widgets
    if @commit.is_local?
      @message_label.style_sheet = 'QLabel { color: red }'
      @message_label.tool_tip = 'Lokalny commit'
    end
    @message_label.text = @commit.message
    @message_label.font = Qt::Font.new('Verdana', 15)
    @description_label.text = "przez #{@commit.author_name} #{@commit.humanized_time_difference}"
    @copy_sha_button.text = 'SHA'
    @copy_sha_button.maximum_size = Qt::Size.new(50, 25)
    @copy_sha_button.tool_tip = 'Skopiuj SHA'
  end

  def setup_slots
    connect(@copy_sha_button, SIGNAL(:clicked), self, SLOT(:copy_commit_sha))
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

    right_layout = Qt::VBoxLayout.new
    right_layout.add_widget(@copy_sha_button)
    layout.add_layout(right_layout)
    set_layout(layout)
  end


  def paintEvent(event)
    painter = Qt::Painter.new(self)
    painter.drawRect(rect)
    painter.end
  end

  def copy_commit_sha
    $qApp.clipboard.text = @commit.sha
    absolute_position = @copy_sha_button.map_to_global(Qt::Point.new(0, 10))
    Qt::ToolTip::show_text(absolute_position, 'Skopiowane!')
  end

end