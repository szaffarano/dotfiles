local wk = require("which-key")

wk.register({
  gz = {
    name  = "neuron", -- optional group name
    b     = 'find backlinks',
    B     = 'find backlinks and insert selected',
    [']'] = 'go to next link',
    ['['] = 'go to previous link',
    i     = 'goto Zettelkasten index',
    n     = 'create a new note',
    s     = 'start the neuron server',
    t     = 'find all tags and insert',
    z     = 'find your notes',
    Z     = 'insert the id of the note that is found',
  },
})



