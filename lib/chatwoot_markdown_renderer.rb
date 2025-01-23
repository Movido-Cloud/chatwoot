class ChatwootMarkdownRenderer
  def initialize(content)
    @content = content
  end

  def render_message
    html = CommonMarker.render_html(@content, [:UNSAFE])
    doc = CommonMarker.render_doc(html, [:UNSAFE])
    render_as_html_safe(doc.to_html(:UNSAFE))
  end

  def render_article
    markdown_renderer = CustomMarkdownRenderer.new
    doc = CommonMarker.render_doc(@content, [:UNSAFE], [:table])
    html = markdown_renderer.render(doc.to_html)
    render_as_html_safe(html)
  end

  def render_markdown_to_plain_text
    CommonMarker.render_doc(@content, [:UNSAFE]).to_plaintext
  end

  private

  def render_as_html_safe(html)
    # rubocop:disable Rails/OutputSafety
    html.html_safe
    # rubocop:enable Rails/OutputSafety
  end
end
