func power(w: Int64, v: Int64, p: Int64) -> Int64 {
  var ret = 1L
  var a = w
  var b = v;
  while b > 0L {
    if b % 2L == 1L {
      ret = ret * a % p
    }
    a = a * a % p
    b = b / 2L    
  }
  ret
}
func init {
  print(power(2L, 3L, 100L))
  
}

