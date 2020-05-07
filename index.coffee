SYMBOL = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_".split("")
SYMBOL_LEN = SYMBOL.length

toString = Number.prototype.toString

Number.prototype.toString = (radix) ->
  if radix and radix > 36 and radix <= SYMBOL_LEN
    decimal = this
    conversion = ""
    while decimal >= 1
      conversion = SYMBOL[(decimal - (radix * Math.floor(decimal / radix)))] +
                     conversion
      decimal = Math.floor(decimal / radix)
    return conversion
  else
    toString.call @, radix

console.log 9123341.toString(64)
