def isSquareNumber(n):
    if n<1:
       return False
    
    i = 1
    while n>=(i*i):
       if n == (i*i):
          return True
       i += 1   
    
    return False
# ------------------------------------------------------------------------------
def pyramidalNumber(n):
    Pn = 0
    k = 1
    while k<=n:
          Pn += k*k
          k += 1
    
    return Pn
# ------------------------------------------------------------------------------     
def isPyramidalNumber(n):
    if n<1:
       return False

    i = 1
    while n>= pyramidalNumber(i):
       if n == pyramidalNumber(i):
          return True
       i += 1   
    
    return False