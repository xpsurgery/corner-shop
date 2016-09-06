describe('stock levels') do
  example('works') do
    out = `echo "" | make run`
    expect(out).to eq("Welcome to our little corner shop!\n\nFor help, type 'h' or 'help' or '?'\n\nshop> shop> \n\nGoodbye. Thanks for your custom!\n\n")
  end
end
