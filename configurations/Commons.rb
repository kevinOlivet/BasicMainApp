DEBUG_DOMAINS = [
'BasicCommons',
'BasicUIElements',
'CuotasModule',
'OPCommons',
'OPHelpCenter',
'OPUIElements'
]

IGNORE_ASSETS_DOMAINS = [ 'BasicCommons', 'BasicUIElements', 'OPCommons', 'OPUIElements']

# Print text to console with this codes: Colors red = 31 green = 32 blue = 34
def color(color=32)
  printf "\033[#{color}m"
  yield
  printf "\033[0m"
end
