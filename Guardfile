# frozen_string_literal: true

Guardfile

guard :rubocop, all_on_start: false, cli: ['--auto-correct'] do
  watch(/.+\.rb$/)
  watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
end
