DEBUG_DOMAINS = [
  'Commons', 'UIElements', 'Autenticacion', 'Consumo', 'Tarjetas', 'Pagos', 'Transferencias', 'Inversiones', 'Transversal', 'OnOff', 'Cuentas', 'PFM', 'Recargas', 'Entrust', 'Fidelizacion', 'Descuentos', 'TarjetaCreditoAvisoViaje', 'TarjetaVirtual', 'AlcanciaDigital'
]

IGNORE_ASSETS_DOMAINS = [ 'Commons', 'UIElements' ]

# Print text to console with this codes: Colors red = 31 green = 32 blue = 34
def color(color=32)
  printf "\033[#{color}m"
  yield
  printf "\033[0m"
end
