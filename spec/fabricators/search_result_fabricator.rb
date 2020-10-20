Fabricator(:search_result) do
  report
  count_adwords_advertisers { (rand * 10).round }
  count_links               { (rand * 100_000).round }
  count_hits                { (rand * 1_000_000).round }
  elapsed_time              { rand.round(2) }
  html                      "<html><head></head><body><h1>#{FFaker::HipsterIpsum.word}</h1></body></html>"
end
