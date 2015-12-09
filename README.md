# Octopress Codeblock

Write beautiful code snippets within any template.

[![Build Status](https://travis-ci.org/octopress/codeblock.svg?branch=master)](https://travis-ci.org/octopress/codeblock)
[![Gem Version](https://badge.fury.io/rb/octopress-codeblock.svg)](http://badge.fury.io/rb/octopress-codeblock)

## Installation

### Using Bundler

Add this gem to your site's Gemfile in the `:jekyll_plugins` group:

    group :jekyll_plugins do
      gem 'octopress-codeblock'
    end

Then install the gem with Bundler

    $ bundle

### Manual Installation

    $ gem install octopress-codeblock

Then add the gem to your Jekyll configuration.

    gems:
      - octopress-codeblock

## Usage

    {% codeblock [options] %}
    [lines of code code]
    {% endcodeblock %}

### Options

Note that order does not matter.

| Options      | Example                | Description                                                           |
|:-------------|:-----------------------|:----------------------------------------------------------------------|
|`lang`        | `lang:ruby`                 | Used by the syntax highlighter. Passing 'plain' disables highlighting.|
|`title`       | `title:"Figure 1.A"`   | Add a figcaption title to your code block. |
|`link_text`   | `link_text:"Download"` | Text for the link, default: `"link"`. |
|`linenos`     | `linenos:false`        | Disable line numbering. |
|`start`       | `start:5`              | Start the line numbering at the given value. |
|`mark`        | `mark:1-4,8`           | Highlight lines of code. This example marks lines 1,2,3,4 and 8 |
|`class`       | `class:"css example"`  | Add CSS class names to the code `<figure>` element |


### Example

```
{% codeblock lang:ruby title:"Check if a number is prime" mark:3 %}
class Fixnum
  def prime?
    ('1' * self) !~ /^1?$|^(11+?)\1+$/
  end
end
{% endcodeblock %}
```

Demo

<!-- title:"Check if a number is prime" mark:3 -->
```ruby
class Fixnum
  def prime?
    ('1' * self) !~ /^1?$|^(11+?)\1+$/
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
