# number-radix-64 

let number prototype toString support radix 64 

```
var SYMBOL, SYMBOL_LEN, toString;

SYMBOL = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_".split("");

SYMBOL_LEN = SYMBOL.length;

toString = Number.prototype.toString;

Number.prototype.toString = function(radix) {
  var conversion, decimal;
  if (radix && radix > 36 && radix <= SYMBOL_LEN) {
    decimal = this;
    conversion = "";
    while (decimal >= 1) {
      conversion = SYMBOL[decimal - (radix * Math.floor(decimal / radix))] + conversion;
      decimal = Math.floor(decimal / radix);
    }
    return conversion;
  } else {
    return toString.call(this, radix);
  }
};
```
