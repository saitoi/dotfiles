return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
  █████████             ███   █████            
 ███░░░░░███           ░░░   ░░███             
░███    ░░░   ██████   ████  ███████    ██████ 
░░█████████  ░░░░░███ ░░███ ░░░███░    ███░░███
 ░░░░░░░░███  ███████  ░███   ░███    ░███ ░███
 ███    ░███ ███░░███  ░███   ░███ ███░███ ░███
░░█████████ ░░████████ █████  ░░█████ ░░██████ 
 ░░░░░░░░░   ░░░░░░░░ ░░░░░    ░░░░░   ░░░░░░  
]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
      opts.theme = "doom"
    end,
  },
}

-- experimental dashboards:
--
--    SSSSSSSSSSSSSSS                   iiii         tttt
--  SS:::::::::::::::S                 i::::i     ttt:::t
-- S:::::SSSSSS::::::S                  iiii      t:::::t
-- S:::::S     SSSSSSS                            t:::::t
-- S:::::S             aaaaaaaaaaaaa  iiiiiittttttt:::::ttttttt      ooooooooooo
-- S:::::S             a::::::::::::a i:::::t:::::::::::::::::t    oo:::::::::::oo
--  S::::SSSS          aaaaaaaaa:::::a i::::t:::::::::::::::::t   o:::::::::::::::o
--   SS::::::SSSSS              a::::a i::::tttttt:::::::tttttt   o:::::ooooo:::::o
--     SSS::::::::SS     aaaaaaa:::::a i::::i     t:::::t         o::::o     o::::o
--        SSSSSS::::S  aa::::::::::::a i::::i     t:::::t         o::::o     o::::o
--             S:::::Sa::::aaaa::::::a i::::i     t:::::t         o::::o     o::::o
--             S:::::a::::a    a:::::a i::::i     t:::::t    ttttto::::o     o::::o
-- SSSSSSS     S:::::a::::a    a:::::ai::::::i    t::::::tttt:::::o:::::ooooo:::::o
-- S::::::SSSSSS:::::a:::::aaaa::::::ai::::::i    tt::::::::::::::o:::::::::::::::o
-- S:::::::::::::::SS a::::::::::aa:::i::::::i      tt:::::::::::ttoo:::::::::::oo
--  SSSSSSSSSSSSSSS    aaaaaaaaaa  aaaiiiiiiii        ttttttttttt    ooooooooooo
