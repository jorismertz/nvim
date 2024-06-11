return {
  'nat-418/boole.nvim',
  event = 'VeryLazy',
  config = {
    mappings = {
      increment = '<C-s>',
      decrement = '<C-x>'
    },
    additions = {
      { 'foo', 'bar', 'baz' },
      { 'tic', 'tac', 'toe' },
      { 'hex', 'rgb', 'hsl' }
    },
    allow_caps_additions = {
      { 'enable', 'disable' }
    }
  }
}
