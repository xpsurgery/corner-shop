describe('stock levels') do
  example('works') do
    out = `echo "s" | bin/shop.rb`
    expect(out).to eq("Welcome to our little corner shop!\n\nFor help, type 'h' or 'help' or '?'\n\nshop> 01 12 1045        3\n10 04 2761       17\n24 17 5990       50\n01 01 6000      105\nshop> \n\nGoodbye. Thanks for your custom!\n\n")
  end
end
