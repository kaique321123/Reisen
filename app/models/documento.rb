class Documento < ApplicationRecord
  validates :title, presence: true

  # naive section parsing helper for tests (store sections in content as '## Section Title\nBody')
  def section_body(title)
    return '' unless content
    # more robust parse: capture section body after heading
    m = content.match(/##\s+#{Regexp.escape(title)}\s*\n(.*?)(?=\n##\s|\z)/m)
    m ? m[1].strip : ''
  end

  def update_section(title, body)
    self.content ||= ''
    heading = "## #{title}\n"
    if !content.include?("## #{title}")
      self.content = content.rstrip + "\n\n#{heading}#{body}\n"
    else
      pattern = /(##\s+#{Regexp.escape(title)}\n).*?(?=\n## |\z)/m
      # use Regexp.last_match inside block to keep the captured heading
      self.content = content.gsub(pattern) { "#{Regexp.last_match(1)}#{body}\n" }
    end
    save!
  end
end