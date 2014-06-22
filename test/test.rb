system('jekyll build')
diff = `diff _site/index.html expected.html`
abort "Filed with diff: #{diff}" if diff.size > 0
