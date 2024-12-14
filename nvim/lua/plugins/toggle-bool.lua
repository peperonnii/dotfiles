return {
  {
    'gerazov/toggle-bool.nvim',
    config = function()
      require('toggle-bool').setup {
        mapping = '<C-b>',
        additional_toggles = {
          Yes = 'No',
          On = 'Off',
          ['0'] = '1',
          Enable = 'Disable',
          Enabled = 'Disabled',
          First = 'Last',
          Before = 'After',
          Persistent = 'Ephemeral',
          Internal = 'External',
          Start = 'Stop',
          In = 'Out',
          Open = 'Close',
          Enter = 'Exit',
          Lock = 'Unlock',
          Connect = 'Disconnect',
          Mount = 'Dismount',
          Import = 'Export',
          Ingress = 'Egress',
          Allow = 'Deny',
          All = 'None',
        },
      }
    end,
  },
}
