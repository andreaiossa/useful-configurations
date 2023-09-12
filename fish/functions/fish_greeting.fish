function fish_greeting
  set -l json_file (curl -s "https://api.quotable.io/random")
  set -l content (echo $json_file | jp content)
  set -l author (echo $json_file | jp author)

  set_color cyan; echo $content
  set_color cyan; echo $author.

end