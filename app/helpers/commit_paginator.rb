require_relative 'commit_page'

class CommitPaginator

  def initialize(commit_provider, per_page)
    @commit_provider = commit_provider
    @per_page = per_page
    @page_index = 0
  end

  def current_page
    from_index = @page_index * @per_page
    to_index = from_index + @per_page
    commits = @commit_provider.get_commits(from_index, to_index)
    CommitPage.new(commits)
  end

  def backward
    @page_index -= 1
  end

  def foreward
    @page_index += 1
  end

  def has_prev_page?
    page = get_page(@page_index - 1)
    !page.empty?
  end

  def has_next_page?
    page = get_page(@page_index + 1)
    !page.empty?
  end

  private

  def get_page(page_index)
    from_index = page_index * @per_page
    to_index = from_index + @per_page
    commits = @commit_provider.get_commits(from_index, to_index)
    CommitPage.new(commits)
  end

end

