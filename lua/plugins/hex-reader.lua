return{
  -- 'camerondixon/hex-reader.nvim',
  "CameronDixon0/hex-reader.nvim",
  event = "VeryLazy",
  config = function()
    require('hex_reader').setup()
  end
}
