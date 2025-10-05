class Documento < ApplicationRecord
  validates :title, presence: true

  # naive section parsing helper for tests (store sections in content as '## Section Title\nBody')
  def section_body(title)
    return '' unless content
    # simple parse: find heading '## title' and return following paragraph
    parts = content.split(/^## /)
    match = parts.find { |p| p.start_with?(title) }
    return '' unless match
    # remove the heading line
    match_lines = match.lines[1..] || []
    match_lines.join.strip
  end

  def update_section(title, body)
    self.content ||= ''
    unless content.include?("## #{title}")
      self.content += "\n\n## #{title}\n#{body}"
    else
      self.content = content.gsub(/(## #{Regexp.escape(title)}\n).*?(?=\n## |\z)/m) { "\1#{body}\n" }
    end
    save!
  end
end
