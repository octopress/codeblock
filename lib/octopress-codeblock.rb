require 'octopress-codeblock/version'
require 'octopress-code-highlighter'
require 'liquid'

module Octopress
  module Codeblock
    class Tag < Liquid::Block
      CaptionUrlTitle = /(\S[\S\s]*)\s+(https?:\/\/\S+|\/\S+)\s*(.+)?/i
      Caption = /(\S[\S\s]*)/

      def initialize(tag_name, markup, tokens)
        @markup = markup
        super
      end

      def render(context)
        code = super.strip.encode("UTF-8")

        begin
          highlight(code, get_options)
        rescue => e
          CodeHighlighter.highlight_failed(e, "{% codeblock [title] [url] [link text] [lang:language] [start:#] [mark:#,#-#] [linenos:false] %}\ncode\n{% endcodeblock %}", @markup, code)
        end
      end
        
      def get_options
        clean_markup = CodeHighlighter.clean_markup(@markup)
        defaults = {}

        if clean_markup =~ CaptionUrlTitle
          defaults = {
            title: $2,
            url: $2,
            link_text: $3,
          }
        elsif clean_markup =~ Caption
          defaults = {
            title: $1
          }
        end

        if defaults[:title] =~ /\S[\S\s]*\w+\.(\w+)/
          defaults[:lang] = $1
        end

        CodeHighlighter.parse_markup(@markup, defaults)
      end


      def highlight(code, options)
        options[:aliases] = @aliases || {}
        code = CodeHighlighter.highlight(code, options)
        code = "<notextile>#{code}</notextile>" if !@ext.nil? and @ext.match(/textile/)
        code
      end
    end
  end
end

Liquid::Template.register_tag('codeblock', Octopress::Codeblock::Tag)

if defined? Octopress::Docs
  Octopress::Docs.add({
    name:        "Octopress Codeblock",
    gem:         "octopress-codeblock",
    description: "A Liquid tag for writing beatuiful code snippets",
    path:        File.expand_path(File.join(File.dirname(__FILE__), "../")),
    source_url:  "https://github.com/octopress/codeblock",
    version:     Octopress::Codeblock::VERSION
  })
end
